import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_bloc/data/models/timer_model.dart';
import 'package:multi_bloc/screens/timer/start_timer.dart';
import 'package:multi_bloc/screens/timer/widgets/timer_ink.dart';
import 'package:multi_bloc/screens/timer/widgets/timer_textfield.dart';
import 'package:multi_bloc/utils/styles/app_style.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  TextEditingController minuteController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  List categories = [
    TimerModel(id: 1, name: "Read a book"),
    TimerModel(id: 1, name: "Listen to music"),
    TimerModel(id: 1, name: "Have a shower"),
    TimerModel(id: 1, name: "Watch a TV"),
    TimerModel(id: 1, name: "Play a game"),
  ];
  var category = [];

  String work = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                  color: const Color(0xFFE3E9E9),
                  borderRadius: BorderRadius.circular(25.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter Time",
                      style: AppStyle.interBold.copyWith(fontSize: 16.sp)),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TimerTextField(
                          controller: secondController, hintText: 'second'),
                      Text(":",
                          style: AppStyle.interBold.copyWith(fontSize: 50.sp)),
                      TimerTextField(
                          controller: minuteController, hintText: 'minute')
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            MultiSelectDialogField(
              buttonText: Text("Select a category",
                  style: AppStyle.interBold.copyWith(fontSize: 14.sp)),
              buttonIcon: Icon(Icons.arrow_drop_down, size: 30.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(width: 1.w, color: Colors.black)),
              title: Text("Select a category",
                  style: AppStyle.interBold.copyWith(fontSize: 22.sp)),
              items: categories.map((e) => MultiSelectItem(e, e.name)).toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                category = values;
                work = categories[0].name.toString();
              },
            ),
            const Spacer(),
            TimerInk(
              onTap: () {
                if (work.isNotEmpty) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => StartTimer(
                        title: work,
                        minute: minuteController.text.isEmpty
                            ? 0
                            : int.parse(minuteController.text),
                        second: secondController.text.isEmpty
                            ? 0
                            : int.parse(secondController.text),
                      ),
                    ),
                  );
                  // minuteController.clear();
                  // secondController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Please select a category",
                        style: AppStyle.interBold.copyWith(fontSize: 18.sp),
                      ),
                    ),
                  );
                }
              },
              text: "Let's go",
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
