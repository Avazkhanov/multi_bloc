import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_bloc/cubits/timer_cubit/timer_cubit.dart';
import 'package:multi_bloc/cubits/timer_cubit/timer_state.dart';
import 'package:multi_bloc/screens/timer/widgets/timer_ink.dart';
import 'package:multi_bloc/utils/styles/app_style.dart';

class StartTimer extends StatefulWidget {
  const StartTimer(
      {super.key,
      required this.title,
      required this.minute,
      required this.second});

  final String title;
  final int minute;
  final int second;

  @override
  State<StartTimer> createState() => _StartTimerState();
}

class _StartTimerState extends State<StartTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          final timerCubit = BlocProvider.of<TimerCubit>(context);
          timerCubit.startTimer(widget.second, widget.minute, widget.title);
          return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
            if (state is TimerInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TimerRunning) {
              return Column(
                children: [
                  SizedBox(height: 200.h),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: const CircularProgressIndicator(
                            value: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.duration.toString().substring(0, 7),
                          style: AppStyle.interBold.copyWith(fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    state.title,
                    style: AppStyle.interBold
                        .copyWith(fontSize: 22.sp, color: Colors.red),
                  )
                ],
              );
            }
            return Center(
              child: TimerInk(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: "Go back"),
            );
          });
        },
      ),
    );
  }
}
