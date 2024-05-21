import 'package:doctor_app/firebase_options.dart';
import 'package:doctor_app/utils/router/app_routes.dart';
import 'package:doctor_app/utils/router/route_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controllers/note_controller/get_note_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(GetNoteController());
  await Get.find<GetNoteController>().getAllNotes();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (b, O, p1) => GetMaterialApp(
        title: 'doctor_app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteName.authCheckPage,
        getPages: AppRoutes.appRoutes(),
      ),
    );
  }
}
