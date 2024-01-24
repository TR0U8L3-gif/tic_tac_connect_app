import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';

class Board {
  Board({
    required this.rowLength,
    required this.columnLength,
  }) {
    columnLength = _checkBoardSize(size: columnLength);
    rowLength = _checkBoardSize(size: rowLength);
    playersMax = _getPlayersMax();
    connectMax = _getConnectMax();
    board = _generateEmptyBoard();
  }

  Board._clone(Board other)
      : rowLength = other.rowLength,
        columnLength = other.columnLength,
        board = List.from(other.board) {
    connectMax = other.connectMax;
    playersMax = other.playersMax;
  }

  factory Board.fromMap(Map<String, dynamic> map) {
    final decodedBoard = <List<Figure?>>[];
    final rowLength = map['rowLength'] as int? ?? 3;
    final columnLength = map['columnLength'] as int? ?? 3;
    final jsonBoard = map['board'] as List<String?>? ?? [];

    for (var col = 0; col < columnLength; col++) {
      final rowList = <Figure?>[];
      for (var row = 0; row < rowLength; row++) {
        Figure? figure;
        try {
          switch (jsonBoard[row + (col * rowLength)]) {
            case 'X':
              figure = const FigureCross();
            case 'O':
              figure = const FigureCircle();
            case 'S':
              figure = const FigureSquare();
            case 'T':
              figure = const FigureTriangle();
            default:
              figure = null;
              break;
          }
        } catch (e) {
          debugPrint('$e');
          figure = null;
        }

        rowList.add(figure);
      }
      decodedBoard.add(rowList);
    }

    return Board(rowLength: rowLength, columnLength: columnLength)
      ..board = decodedBoard;
  }

  ///x
  int rowLength;

  ///y
  int columnLength;

  ///maximum number of pieces to win the game
  int connectMax = 2;

  ///maximum number of players who can play the game
  int playersMax = 3;

  //board of figures
  late List<List<Figure?>> board;

  Board clone() {
    return Board._clone(this);
  }

  Map<String, dynamic> toMap() {
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
      'board': boardList,
      'rowLength': rowLength,
      'columnLength': columnLength,
    };
  }

  int _getPlayersMax() {
    var result = min(columnLength, rowLength) - 1;

    if (result > kMaxPlayers) {
      result = kMaxPlayers;
    }

    if (result < kMinPlayers) {
      return kMinPlayers;
    }

    return result;
  }

  int _getConnectMax() {
    var result = min(columnLength, rowLength) - (playersMax - kMinPlayers);

    if (result > kMaxConnect) {
      result = kMaxConnect;
    }

    if (result < kMinConnect) {
      return kMinConnect;
    }

    return result;
  }

  int _checkBoardSize({required int size}) {
    var result = size;
    if (size < kMinBoardSize) {
      result = kMinBoardSize;
    }
    if (size > kMaxBoardSize) {
      result = kMaxBoardSize;
    }
    return result;
  }

  List<List<Figure?>> _generateEmptyBoard() {
    return List<List<Figure?>>.generate(
      columnLength,
      (int index) => List<Figure?>.filled(rowLength, null),
      growable: false,
    );
  }

  void cleanBoard() {
    board = _generateEmptyBoard();
  }

  bool placePiece({required Figure figure, required int x, required int y}) {
    if (x < 0 || x >= rowLength) {
      return false;
    }

    if (y < 0 || y >= columnLength) {
      return false;
    }

    try {
      board[y][x] = figure;
    } catch (e) {
      debugPrint('placePiece error: $e');
      return false;
    }

    return true;
  }

  String boardToString() {
    var output = '';
    for (final row in board) {
      output += row.toString();
      output += '\n';
    }
    return output;
  }
  
}
