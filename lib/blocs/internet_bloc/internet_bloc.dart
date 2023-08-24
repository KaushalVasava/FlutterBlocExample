import 'dart:async';

import 'package:fluttor_app/blocs/internet_bloc/internet_event.dart';
import 'package:fluttor_app/blocs/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InitialState()) {
    on<LostEvent>((event, emit) => emit(LostState()));
    on<GainedEvent>((event, emit) => emit(GainedState()));

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(GainedEvent());
      } else {
        add(LostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
