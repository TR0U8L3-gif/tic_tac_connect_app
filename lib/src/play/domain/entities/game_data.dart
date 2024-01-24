import 'package:equatable/equatable.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';

class GameData extends Equatable {
  const GameData(
      {required this.playerOrder,
      required this.connect,
      required this.rowLength,
      required this.columnLength,
      required this.board,
      required this.round,
      });

  final List<List<Figure?>> board;
  final int round;

  // additional
  final List<Figure> playerOrder;
  final int connect;
  final int rowLength;
  final int columnLength;

  GameData copyWith({
    List<Figure>? playerOrder,
    List<List<Figure?>>? board,
    int? round,
    int? connect,
    int? rowLength,
    int? columnLength,
  }) {
    return GameData(
      playerOrder: playerOrder ?? this.playerOrder,
      board: board ?? this.board,
      round: round ?? this.round,
      connect: connect ?? this.connect,
      rowLength: rowLength ?? this.rowLength,
      columnLength: columnLength ?? this.columnLength,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
