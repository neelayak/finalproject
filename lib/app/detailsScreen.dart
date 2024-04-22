import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? bloodPressure = '';
  String? temperature = '';
  String? oxygenLevel = '';
  String? _selectedItem;
  String? patient_id = '';
  String? filename;
  String? patient_age = '';
  String? fileurl = '';
  var hospita = ['Hospital 1', 'Hospital 2', 'Hospital 3'];
  String? selected_hospital = 'Hospital 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthSync Emergency'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Enter patient identifier number ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Patient id',
                    hintText: 'Patient id',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter blood pressure';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    patient_id = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Enter patient Age',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Patient Age',
                    hintText: 'Patient Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter blood pressure';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    patient_age = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Enter Blood Pressure ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Blood Pressure',
                    hintText: 'Blood Pressure',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter blood pressure';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    bloodPressure = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Enter Temperature',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Temperature',
                    hintText: 'Temperature',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter temperature';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    temperature = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Enter Oxygen Level ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Oxygen Level',
                    hintText: 'Oxygen Level',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter oxygen level';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    oxygenLevel = value;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Select Hospital',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          items: hospita.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedItem = newValue;
                              selected_hospital = newValue;
                            });
                          },
                          hint: Text('Select an option'),
                          underline: SizedBox(), // removes the underline border
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Select EKG file',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );
                              if (result != null) {
                                File file = File(result.files.single.path!);
                                setState(() {
                                  uploadFile(file);
                                  filename = basename(file.path);
                                });
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Text(
                                (filename != null) ? filename! : 'select file'),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Here you can do whatever you want with the collected data
                      print('Blood Pressure: $bloodPressure');
                      print('Temperature: $temperature');
                      print('Oxygen Level: $oxygenLevel');
                      Future.delayed(Duration(seconds: 2), () {
                        sendData();
                      });
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendData() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child('users').push().set({
      'id': patient_id,
      'temperature': temperature,
      'oxygen_lvl': oxygenLevel,
      'patient_age': patient_age,
      'blood_pressure': bloodPressure,
      'hospital_name': selected_hospital,
      "file_link": fileurl

      // Add more fields as needed
    }).then((_) {
      Fluttertoast.showToast(
          msg: "Data Sent",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void uploadFile(File file) async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('uploads/${file.path.split('/').last}');
      UploadTask uploadTask = storageReference.putFile(file);
      String downloadURL = await storageReference.getDownloadURL();
      fileurl = downloadURL;
      await uploadTask.whenComplete(() => print('File uploaded successfully'));
    } catch (e) {
      print('Failed to upload file: $e');
    }
  }
}
