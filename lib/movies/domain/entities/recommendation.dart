import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final int id;

  final String? backDropPath;
  const Recommendation({required this.id, this.backDropPath});

  @override
  List<Object?> get props => [id, backDropPath];
}
