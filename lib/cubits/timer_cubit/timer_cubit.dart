import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:multi_bloc/cubits/timer_cubit/timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  late Timer _timer;

  TimerCubit() : super(TimerInitial());

  void startTimer(TimeOfDay timeOfDay, String tag) {
    Duration duration = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

    int durationInSeconds = duration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (durationInSeconds > 0) {
        durationInSeconds -= 1;
        duration = Duration(seconds: durationInSeconds);
        emit(TimerRunning(duration, tag));
      } else {
        _timer.cancel();
        emit(TimerStopState());
      }
    });
  }


  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}