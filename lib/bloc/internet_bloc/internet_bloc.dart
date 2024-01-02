import 'dart:async';

// import 'package:connectivity/connectivity.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:example1/bloc/internet_bloc/internet_event.dart';
import 'package:example1/bloc/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  StreamSubscription? connectivitySubscription;//for listen to terminate when closing an application
  Connectivity _connectivity=Connectivity();

  InternetBloc():super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    connectivitySubscription=_connectivity.onConnectivityChanged.listen((result) { //listen can still be running in the background which can affect the performance
      if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }
     });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}