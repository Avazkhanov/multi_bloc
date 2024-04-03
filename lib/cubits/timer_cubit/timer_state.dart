abstract class TimerState {
  const TimerState();

  @override
  List<Object?> get props => [];
}

class TimerInitial extends TimerState {}

class TimerRunning extends TimerState {
  final Duration duration;
  final String title;

  const TimerRunning(this.duration, this.title);

  @override
  List<Object?> get props => [duration];
}

class TimerStopState extends TimerState {}
