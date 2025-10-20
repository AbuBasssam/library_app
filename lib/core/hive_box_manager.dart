import 'package:hive/hive.dart';
import 'package:synchronized/synchronized.dart';

class HiveBoxManager {
  final _locks = <String, Lock>{};
  final _refCounts = <String, int>{};
  final _boxes = <String, Box>{};

  /// openBoxIfNeeded returns the Box after ensuring it is open and increments ref count.
  Future<Box<T>> openBox<T>(String boxName, {bool lazy = false}) async {
    // use a Lock per box to avoid race conditions
    final lock = _locks.putIfAbsent(boxName, () => Lock());

    return await lock.synchronized(() async {
      if (_boxes.containsKey(boxName)) {
        _refCounts[boxName] = (_refCounts[boxName] ?? 0) + 1;
        return _boxes[boxName] as Box<T>;
      }

      // open the box
      final box = await Hive.openBox<T>(boxName);
      _boxes[boxName] = box;
      _refCounts[boxName] = 1;
      return box;
    });
  }

  /// decrement refcount and close when zero
  Future<void> releaseBox(String boxName) async {
    final lock = _locks.putIfAbsent(boxName, () => Lock());

    await lock.synchronized(() async {
      final count = (_refCounts[boxName] ?? 0) - 1;
      if (count <= 0) {
        // close for real
        final box = _boxes.remove(boxName);
        _refCounts.remove(boxName);
        await box?.close();
        // optionally remove lock: _locks.remove(boxName);
      } else {
        _refCounts[boxName] = count;
      }
    });
  }

  /// helper to check if box is open
  bool isBoxOpen(String boxName) =>
      _boxes.containsKey(boxName) && _boxes[boxName]!.isOpen;

  /// close everything (e.g., app disposing)
  Future<void> closeAll() async {
    final keys = _boxes.keys.toList();
    for (final k in keys) {
      await _boxes[k]?.close();
      _boxes.remove(k);
      _refCounts.remove(k);
    }
  }
}
