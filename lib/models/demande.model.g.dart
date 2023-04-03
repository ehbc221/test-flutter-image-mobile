// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demande.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Demande _$DemandeFromJson(Map<String, dynamic> json) => Demande(
      id: json['id'] as int,
      image: json['image'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$DemandeToJson(Demande instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'photo': instance.photo,
    };
