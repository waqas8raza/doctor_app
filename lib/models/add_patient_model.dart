class PatientData {
  String? id;
  String? patientName;
  String? sessionFor;
  String? status;
  String? time;
  String? date;
  String? packageType;
  int? sessionTime;

  PatientData(
      {this.id,
      this.patientName,
      this.time,
      this.status,
      this.date,
      this.packageType,
      this.sessionTime,
      this.sessionFor});

  factory PatientData.fromJson(Map<String, dynamic> json) {
    return PatientData(
      id: json['id'] as String,
      sessionTime: json['sessionTime'] as int,
      patientName: json['patientName'] as String,
      status: json['status'] as String,
      sessionFor: json['sessionFor'] as String,
      time: json['time'] as String,
      date: json['date'] as String,
      packageType: json['packageType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sessionTime'] = sessionTime;
    data['sessionFor'] = sessionFor;
    data['packageType'] = packageType;
    data['patientName'] = patientName;

    data['time'] = time;
    data['date'] = date;
    data['status'] = status;
    return data;
  }
}
