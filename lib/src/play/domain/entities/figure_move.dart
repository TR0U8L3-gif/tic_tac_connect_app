import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/position.dart';

class FigureMove {

  const FigureMove({
    required this.figure,
    required this.position,
  });

  final Figure figure;
  final Position position;


}
