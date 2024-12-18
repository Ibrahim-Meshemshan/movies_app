// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsResponseModelAdapter
    extends TypeAdapter<MovieDetailsResponseModel> {
  @override
  final int typeId = 0;

  @override
  MovieDetailsResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsResponseModel(
      genres: (fields[5] as List?)?.cast<MoviesDetails>(),
      id: fields[0] as int?,
      releaseDate: fields[4] as DateTime?,
      runtime: fields[1] as int?,
      title: fields[2] as String?,
      voteAverage: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsResponseModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(1)
      ..write(obj.runtime)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MoviesDetailsAdapter extends TypeAdapter<MoviesDetails> {
  @override
  final int typeId = 1;

  @override
  MoviesDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesDetails(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
