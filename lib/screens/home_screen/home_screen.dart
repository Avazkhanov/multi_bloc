import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_bloc/screens/monitoring/monitoring_screen.dart';
import 'package:multi_bloc/screens/timer/timer_screen.dart';
import 'package:multi_bloc/screens/timer/widgets/timer_ink.dart';
import 'package:multi_bloc/utils/styles/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: AppStyle.interBold.copyWith(fontSize: 22.sp),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerInk(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MonitoringScreen(),
                    ),
                  );
                },
                text: "Monitoring screen"),
            SizedBox(height: 20.h),
            TimerInk(onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => TimerScreen(),
                ),
              );
            }, text: "Timer Screen"),
          ],
        ),
      ),
    );
  }
}
