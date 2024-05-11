import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:doctor_app/controllers/patient_controller/add_patient_controller.dart';
import 'package:doctor_app/pages/bottom_navigation_bar_pages/bottom_navigation_bar_page.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/constants/text_style_constant.dart';

class SessionTimerPage extends StatefulWidget {
  final String name;
  final String id;
  final String sessionFor;
  final int time;

  const SessionTimerPage(
      {super.key,
      required this.name,
      required this.sessionFor,
      required this.time,
      required this.id});

  @override
  _SessionTimerPageState createState() => _SessionTimerPageState();
}

class _SessionTimerPageState extends State<SessionTimerPage> {
  final CountDownController _controller = CountDownController();
  final controller = Get.put(FirebaseService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 246, 238),
      appBar: const MyAppBar(title: 'Session Timer'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 60.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Center(
                    child: CircularCountDownTimer(
                      duration: 900,
                      initialDuration: 0,
                      controller: _controller,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2,
                      ringColor: Colors.grey[300]!,
                      fillColor: Colors.greenAccent,
                      backgroundColor: Colors.white,
                      strokeWidth: 20.0,
                      strokeCap: StrokeCap.round,
                      textStyle: const TextStyle(
                        fontSize: 33.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverse: true,
                      isReverseAnimation: true,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        debugPrint('Countdown Started');
                      },
                      onComplete: () {
                        Get.defaultDialog(
                            onConfirm: () {
                              Get.offAll(() => BottomNavBarPage());
                            },
                            backgroundColor: Colors.greenAccent,
                            title: 'Completed',
                            titleStyle: TextStyle(color: Colors.white),
                            content: const Text(
                              'Session has been Completed',
                              style: TextStyle(color: Colors.white),
                            ));
                        controller.updatePatientStatus(
                          widget.id,
                          'Completed',
                        );
                      },
                      onChange: (String timeStamp) {
                        debugPrint('Countdown Changed $timeStamp');
                      },
                      timeFormatterFunction:
                          (defaultFormatterFunction, duration) {
                        if (duration.inSeconds == 0) {
                          return "Start";
                        } else {
                          return Function.apply(
                              defaultFormatterFunction, [duration]);
                        }
                      },
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      foregroundImage: AssetImage('assets/doctor.jpg'),
                    ),
                    title: Text(
                      widget.name,
                      style: AppTextStyles.bodyBold,
                    ),
                    subtitle: Text(
                      widget.sessionFor,
                      style: AppTextStyles.bodyRegular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 30),
          _button(
            title: "Start",
            onPressed: () => _controller.start(),
          ),
          const SizedBox(width: 10),
          _button(
            title: "Pause",
            onPressed: () => _controller.pause(),
          ),
          const SizedBox(width: 10),
          _button(
            title: "Resume",
            onPressed: () => _controller.resume(),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
