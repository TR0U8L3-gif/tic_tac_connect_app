import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/play/data/models/figure_model.dart';
import 'package:tic_tac_connect_app/src/play/data/models/position_model.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure_move.dart';

class FigureMoveModel extends FigureMove {
  FigureMoveModel({required super.figure, required super.position});
  factory FigureMoveModel.fromMap(Map<String, dynamic> map) {
    return FigureMoveModel(
      figure: FigureModel.fromMap(map['figure'] as DataMap) ,
      position: PositionModel.fromMap(map['position'] as DataMap),
    );
  }
  Map<String, dynamic> toMap() {
    final positionModel = PositionModel(x: position.x, y: position.y);
    final figureModel = FigureModel(symbol: figure.symbol);
    return {
      'figure': figureModel.toMap(),
      'position': positionModel.toMap(),
    };
  }


}
