import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class InitProvider with ChangeNotifier {
  InitProvider({required Map<Bloc<dynamic, dynamic>, Object> initialization})
      : _initialization = initialization {
    if (initialization.isNotEmpty) {
      _done = List.filled(initialization.keys.length, false);
      _getStreams();
    } else {
      _initialized = true;
    }
    notifyListeners();
  }

  final Map<Bloc<dynamic, dynamic>, Object> _initialization;
  List<bool>? _done;
  var _initialized = false;

  Map<Bloc<dynamic, dynamic>, Object> get initialization => _initialization;

  List<bool>? get done => _done;

  bool get initialized => _initialized;

  void _getStreams() {
    for (var index = 0; index < _initialization.keys.length; index++) {
      final bloc = _initialization.keys.toList()[index];
      final blocState = _initialization.values.toList()[index];

      if (bloc.state.runtimeType == blocState) {
        _markAsDone(null, blocState);
        continue;
      }

      StreamSubscription<dynamic>? streamSub;
      streamSub = bloc.stream.listen(
        (state) {
          if (state.runtimeType == blocState) {
            _markAsDone(streamSub, blocState);
          }
        },
        onError: (error) => _markAsDone(streamSub, blocState),
        cancelOnError: true,
      );
    }
  }

  void _markAsDone(
    StreamSubscription<dynamic>? streamSubscription,
    Object state,
  ) {
    final index = _initialization.values.toList().indexOf(state);
    try {
      _done?[index] = true;
      debugPrint('initialized $streamSubscription, $state');
      streamSubscription?.cancel();
    } catch (e) {
      debugPrint('$e');
    }
    _initialized = _done?.reduce((value, element) => value & element) ?? true;
    notifyListeners();
  }
}
