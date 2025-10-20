// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_data_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookDataHiveModelAdapter extends TypeAdapter<BookDataHiveModel> {
  @override
  final int typeId = 1;

  @override
  BookDataHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookDataHiveModel(
      bookId: fields[0] as int,
      title: fields[1] as String,
      author: fields[2] as String,
      coverImage: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookDataHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.coverImage)
      ..writeByte(4)
      ..write(obj.addedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookDataHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
