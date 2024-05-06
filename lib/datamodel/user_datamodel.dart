class UserDataModel {
  String? age;
  String? bloodPressure;
  String? fileLink;
  String? hospitalName;
  String? id;
  String? oxygenLvl;
  String? patientAge;
  String? temperature;
  String? timestamp;

  UserDataModel(
      {this.age,
      this.bloodPressure,
      this.fileLink,
      this.hospitalName,
      this.id,
      this.oxygenLvl,
      this.patientAge,
      this.temperature,
      this.timestamp});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    bloodPressure = json['blood_pressure'];
    fileLink = json['file_link'];
    hospitalName = json['hospital_name'];
    id = json['id'];
    oxygenLvl = json['oxygen_lvl'];
    patientAge = json['patient_age'];
    temperature = json['temperature'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['blood_pressure'] = this.bloodPressure;
    data['file_link'] = this.fileLink;
    data['hospital_name'] = this.hospitalName;
    data['id'] = this.id;
    data['oxygen_lvl'] = this.oxygenLvl;
    data['patient_age'] = this.patientAge;
    data['temperature'] = this.temperature;
    data['timestamp'] = this.timestamp;

    return data;
  }
}
