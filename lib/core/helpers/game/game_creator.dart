import 'dart:math';

import 'package:tic_tac_connect_app/core/utils/constant.dart';

final class GameCreator {
  static int checkBoardSize({required int size}) {
    var result = size;
    if (size < kMinBoardSize) {
      result = kMinBoardSize;
    }
    if (size > kMaxBoardSize) {
      result = kMaxBoardSize;
    }
    return result;
  }

  static int getMaxPlayers({
    required int rowLength,
    required int columnLength,
  }) {
    var result = min(columnLength, rowLength) - 1;

    if (result > kMaxPlayers) {
      result = kMaxPlayers;
    }

    if (result < kMinPlayers) {
      return kMinPlayers;
    }

    return result;
  }

  static int getMaxConnect({
    required int rowLength,
    required int columnLength,
    required int players,
  }) {
    final result = min(columnLength, rowLength) - (players - kMinPlayers);

    if (result < kMinConnect) {
      return kMinConnect;
    }

    return result;
  }
}
