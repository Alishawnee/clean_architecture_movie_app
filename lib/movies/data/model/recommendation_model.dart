import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backDropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(id: json['id'], backDropPath: json['backdrop_path']);
}
