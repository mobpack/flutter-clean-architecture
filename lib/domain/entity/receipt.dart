import 'package:equatable/equatable.dart';

class Receipt extends Equatable {
  final String? calories;
  final String? carbos;
  final String? description;
  final int? difficulty;
  final String? fats;
  final String? headline;
  final String? id;
  final String? image;
  final String? name;
  final String? proteins;
  final String? thumb;
  final String? time;

  const Receipt({
    this.calories,
    this.carbos,
    this.description,
    this.difficulty,
    this.fats,
    this.headline,
    this.id,
    this.image,
    this.name,
    this.proteins,
    this.thumb,
    this.time,
  });

  @override
  List<Object?> get props {
    return [
      calories,
      carbos,
      description,
      difficulty,
      fats,
      headline,
      id,
      image,
      name,
      proteins,
      thumb,
      time,
    ];
  }
}
