import 'package:tic_tac_connect_app/core/utils/typedef.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/game_data.dart';

class GameDataModel extends GameData {
  const GameDataModel({
    required super.playerOrder,
    required super.board,
    required super.round,
    required super.connect,
    required super.rowLength,
    required super.columnLength,
  });

  factory GameDataModel.fromMap({required DataMap map}) {
    final decodedBoard = <List<Figure?>>[];
    final  rowLength = map['rowLength'] as int;
    final columnLength = map['columnLength'] as int;
    final  jsonBoard =  List<String?>.from(map['board'] as List);

    for (var col = 0; col < columnLength; col++) {
      final rowList = <Figure?>[];
      for (var row = 0; row < rowLength; row++) {
        final symbol = jsonBoard[row + (col * rowLength)];
        final figure = symbol == null ? null : Figure.fromSymbol(symbol);
        rowList.add(figure);
      }
      decodedBoard.add(rowList);
    }

    return GameDataModel(
      playerOrder: List<String>.from(map['playerOrder'] as List)
          .map(Figure.fromSymbol)
          .toList(),
      board: decodedBoard,
      round: map['round'] as int,
      connect: map['connect'] as int,
      rowLength: map['rowLength'] as int,
      columnLength: map['columnLength'] as int,
    );
  }

  DataMap toMap() {
    final boardList = <String?>[];
    for (final row in board) {
      for (final figure in row) {
        if (figure == null) {
          boardList.add(null);
        } else {
          boardList.add(figure.symbol);
        }
      }
    }
    return {
      'playerOrder': playerOrder.map((figure) => figure.symbol).toList(),
      'board': boardList,
      'round': round,
      'connect': connect,
      'rowLength': rowLength,
      'columnLength': columnLength,
    };
  }
}
