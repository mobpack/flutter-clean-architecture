import 'package:flutter_clean_architecture/domain/entity/receipt.dart';
import 'package:json_annotation/json_annotation.dart';

part 'receipt_dto.g.dart';

@JsonSerializable()
class ReceiptDTO extends Receipt {
  const ReceiptDTO({
    super.calories,
    super.carbos,
    super.description,
    super.difficulty,
    super.fats,
    super.headline,
    super.id,
    super.image,
    super.name,
    super.proteins,
    super.thumb,
    super.time,
  });

  factory ReceiptDTO.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptDTOToJson(this);
}
