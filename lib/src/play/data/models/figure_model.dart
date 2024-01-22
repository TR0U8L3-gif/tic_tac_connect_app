import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';

class FigureModel extends Figure {
 const FigureModel({super.symbol = ' '});

  factory FigureModel.fromMap(DataMap map) {
    return FigureModel(
      symbol: map['symbol'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return {'symbol': symbol};
  }
}
