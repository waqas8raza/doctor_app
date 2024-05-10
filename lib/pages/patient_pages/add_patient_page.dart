import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

import 'package:doctor_app/controllers/patient_controller/get_patient_controller.dart';
import 'package:doctor_app/models/add_patient_model.dart';
import 'package:doctor_app/pages/patient_pages/patient_details_page.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';

class AddPatientPage extends StatefulWidget {
  final PatientData? patient;

  AddPatientPage({Key? key, this.patient}) : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  late TextEditingController _dateController;
  late TextEditingController nameController;
  late TextEditingController _timeController;
  late TextEditingController descriptionController;
  TimeOfDay _selectedTime = TimeOfDay.now();
  int? time;
  String? sessionType;
  final controller = Get.put(PatientController());
  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    nameController = TextEditingController();
    _timeController = TextEditingController();
    descriptionController = TextEditingController();

    if (widget.patient != null) {
      nameController.text = widget.patient!.patientName ?? '';
      _dateController.text = widget.patient!.date ?? '';
      _timeController.text = widget.patient!.time ?? '';
      descriptionController.text = widget.patient!.sessionFor ?? '';
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    nameController.dispose();
    _timeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = _selectedTime.format(context);
      });
    }
  }

  bool isStandarad = false;
  bool isPremium = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 246, 238),
      appBar: MyAppBar(
        title: widget.patient == null ? 'Add Patient' : 'Update Patient',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 15.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'ID:9836464',
                            style: AppTextStyles.caption,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          hintText: 'Patient name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: const Icon(Icons.description),
                  hintText: 'Session for',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Package Details:',
                style: AppTextStyles.heading2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isStandarad = true;
                      isPremium = false;
                      time = 15;
                      sessionType = 'Standard';
                    });
                  },
                  child: Container(
                    height: 10.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: isStandarad ? Colors.greenAccent : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Standard\n15 mins',
                        style: AppTextStyles.bodyBold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isPremium = true;
                      isStandarad = false;
                      time = 30;
                      sessionType = 'Premium';
                    });
                  },
                  child: Container(
                    height: 10.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: isPremium ? Colors.greenAccent : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Premium\n30 mins',
                        style: AppTextStyles.bodyBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                controller: _timeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: Icon(Icons.timer),
                  hintText: 'Select time',
                ),
                onTap: () {
                  _selectTime(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,
                controller: _dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                  hintText: 'Select date',
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
            ),
            const Spacer(),
            AppButton(
              buttonText: widget.patient == null ? 'Next' : 'Update',
              onPressed: () {
                if (nameController.text.isEmpty ||
                    _timeController.text.isEmpty ||
                    time == null ||
                    _dateController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields.'),
                    ),
                  );
                } else {
                  if (widget.patient == null) {
                    Get.to(
                      () => PatientDetailsPage(
                        patient: PatientData(
                          id: uuid.v4(),
                          patientName: nameController.text,
                          time: _timeController.text,
                          date: _dateController.text,
                          packageType: sessionType!,
                          sessionFor: descriptionController.text,
                          sessionTime: time!,
                          status: 'Pending',
                        ),
                      ),
                    );
                  } else {
                    controller.updatePatient(
                      PatientData(
                        id: widget.patient!.id,
                        patientName: nameController.text,
                        time: _timeController.text,
                        date: _dateController.text,
                        packageType: sessionType!,
                        sessionFor: descriptionController.text,
                        sessionTime: time!,
                        status: 'Pending',
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
