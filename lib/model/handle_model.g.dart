// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HandleModelAdapter extends TypeAdapter<HandleModel> {
  @override
  final int typeId = 1;

  @override
  HandleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HandleModel(
      message: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HandleModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HandleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
