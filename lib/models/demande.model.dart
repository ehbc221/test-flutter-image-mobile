import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'demande.model.g.dart';

/// Modèle pour une demande.
@JsonSerializable()
class Demande {
  const Demande({
    required this.id,
    required this.image,
    required this.photo,
  });

  factory Demande.fromJson(Map<String, dynamic> json) =>
      _$DemandeFromJson(json);

  Map<String, dynamic> toJson() => _$DemandeToJson(this);

  // L'id de la demande
  final int id;

  // Blob
  final String image;

  /// Image Blob
  final String photo;
}
