import 'package:flutter/cupertino.dart';
import 'package:tic_tac_connect_app/core/utils/constant.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/figure.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/game_data.dart';
import 'package:tic_tac_connect_app/src/play/domain/entities/position.dart';

enum PlayerRound {
  current,
  previous,
  next,
}

class GameEngine {
  const GameEngine({
    required this.players,
    required this.rowLength,
    required this.columnLength,
  })  : assert(
          rowLength <= kMaxBoardSize && rowLength >= kMinBoardSize,
          'rowLength must be in the range($kMinBoardSize, $kMaxBoardSize)',
        ),
        assert(
          columnLength <= kMaxBoardSize && columnLength >= kMinBoardSize,
          'columnLength must be in the range($kMinBoardSize, $kMaxBoardSize)',
        ),
        assert(
          players <= kMaxPlayers && players >= kMinPlayers,
          'players must be in the range($kMinPlayers, $kMaxPlayers)',
        );

  ///x
  final int rowLength;

  ///y
  final int columnLength;
  final int players;

  Figure getPlayer({
    required GameData data,
    PlayerRound playerRound = PlayerRound.current,
  }) {
    var playerIndex = 0;
    switch (playerRound) {
      case PlayerRound.current:
        break;
      case PlayerRound.next:
        playerIndex = 1;
      case PlayerRound.previous:
        playerIndex = -1;
    }
    final index = (data.round + playerIndex) % data.playerOrder.length;
    return data.playerOrder[index];
  }

  Figure? checkForWinner({required GameData data}) {
    final rows = columnLength;
    final columns = columnLength;
    final connect = data.connect;

    // row
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j <= columns - connect; j++) {
        final checkBoard = data.board[i].sublist(j, j + connect);
        if (_isFigureListEqual(checkBoard)) {
          return checkBoard.first;
        }
      }
    }

    // column
    for (var i = 0; i <= rows - connect; i++) {
      for (var j = 0; j < columns; j++) {
        final columnValues = <Figure?>[];
        for (var k = 0; k < connect; k++) {
          columnValues.add(data.board[i + k][j]);
        }
        if (_isFigureListEqual(columnValues)) {
          return columnValues.first;
        }
      }
    }

    // top left to bottom right
    for (var i = 0; i <= rows - connect; i++) {
      for (var j = 0; j <= columns - connect; j++) {
        final diagonalValues = <Figure?>[];
        for (var k = 0; k < connect; k++) {
          diagonalValues.add(data.board[i + k][j + k]);
        }
        if (_isFigureListEqual(diagonalValues)) {
          return diagonalValues.first;
        }
      }
    }

    // bottom left to top right
    for (var i = connect - 1; i < rows; i++) {
      for (var j = 0; j <= columns - connect; j++) {
        final diagonalValues = <Figure?>[];
        for (var k = 0; k < connect; k++) {
          diagonalValues.add(data.board[i - k][j + k]);
        }
        if (_isFigureListEqual(diagonalValues)) {
          return diagonalValues.first;
        }
      }
    }

    for (final row in data.board) {
      if (row.any((piece) => piece == null)) {
        return null;
      }
    }

    return FigureNone();
  }

  GameData? placeFigure({
    required GameData data,
    required Position position,
    required Figure figure,
  }) {
    if (figure is FigureNone) {
      return null;
    }

    if (position.x < 0 || position.x >= rowLength) {
      return null;
    }

    if (position.y < 0 || position.y >= columnLength) {
      return null;
    }

    final board = data.board;
    if (board[position.y][position.x] == null) {
      try {
        board[position.y][position.x] = figure;
        return data.copyWith(board: board);
      } catch (e) {
        debugPrint('GameEngine (placeFigure) error: $e');
        return null;
      }
    }

    return null;
  }

  GameData cleanBoard({required GameData data}) {
    final board = _generateEmptyBoard();
    return data.copyWith(
      board: board,
    );
  }

  List<List<Figure?>> _generateEmptyBoard() {
    return List<List<Figure?>>.generate(
      columnLength,
      (int index) => List<Figure?>.filled(rowLength, null),
      growable: false,
    );
  }

  bool _isFigureListEqual(List<Figure?> values) {
    if (values.contains(null)) return false;
    return values.every((element) => element == values[0]);
  }
}
