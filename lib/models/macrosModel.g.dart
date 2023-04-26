// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macrosModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MacrosModel _$MacrosModelFromJson(Map<String, dynamic> json) => MacrosModel(
      calories: json['calories'] as String?,
      carbohydrates_total_g: json['carbohydrates_total_g'] as String?,
      cholesterol_mg: json['cholesterol_mg'] as String?,
      fat_saturated_g: json['fat_saturated_g'] as String?,
      fat_total_g: json['fat_total_g'] as String?,
      fiber_g: json['fiber_g'] as String?,
      foodHabitId: json['foodHabitId'] as String?,
      id: json['_id'] as String?,
      name: json['name'] as String?,
      potassium_mg: json['potassium_mg'] as String?,
      protein_g: json['protein_g'] as String?,
      sodium_mg: json['sodium_mg'] as String?,
      sugar_g: json['sugar_g'] as String?,
    );

Map<String, dynamic> _$MacrosModelToJson(MacrosModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'calories': instance.calories,
      'fat_total_g': instance.fat_total_g,
      'fat_saturated_g': instance.fat_saturated_g,
      'protein_g': instance.protein_g,
      'sodium_mg': instance.sodium_mg,
      'potassium_mg': instance.potassium_mg,
      'cholesterol_mg': instance.cholesterol_mg,
      'carbohydrates_total_g': instance.carbohydrates_total_g,
      'fiber_g': instance.fiber_g,
      'sugar_g': instance.sugar_g,
      'foodHabitId': instance.foodHabitId,
    };
