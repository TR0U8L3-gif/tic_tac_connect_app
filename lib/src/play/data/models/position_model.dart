import 'package:tic_tac_connect_app/src/play/domain/entities/position.dart';

class PositionModel extends Position {
  const PositionModel({required super.x, required super.y});

  factory PositionModel.fromMap(Map<String, dynamic> map) {
    return PositionModel(
      x: map['x'] as int,
      y: map['y'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

}
