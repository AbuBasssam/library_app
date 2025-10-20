// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookListHiveModelAdapter extends TypeAdapter<BookListHiveModel> {
  @override
  final int typeId = 0;

  @override
  BookListHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookListHiveModel(
      id: fields[0] as int,
      name: fields[1] as String,
      coverImage: fields[2] as String?,
      lastModified: fields[3] as DateTime,
      books: (fields[4] as List?)?.cast<BookDataHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookListHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.coverImage)
      ..writeByte(3)
      ..write(obj.lastModified)
      ..writeByte(4)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookListHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
