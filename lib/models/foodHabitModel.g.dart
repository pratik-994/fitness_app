// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodHabitModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodHabitModel _$FoodHabitModelFromJson(Map<String, dynamic> json) =>
    FoodHabitModel(
      calories: json['calories'] as String?,
      id: json['_id'] as String?,
      date: json['date'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$FoodHabitModelToJson(FoodHabitModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'calories': instance.calories,
      'date': instance.date,
    };
