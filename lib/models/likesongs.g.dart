// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likesongs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikeSongsAdapter extends TypeAdapter<LikeSongs> {
  @override
  final int typeId = 2;

  @override
  LikeSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikeSongs(
      url: fields[0] as String?,
      title: fields[1] as String?,
      image: fields[2] as String?,
      id: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LikeSongs obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikeSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
