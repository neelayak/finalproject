import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../datamodel/user_datamodel.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Hospita Database'),
      ),
      body: Container(
        //  height: 300,
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            List<UserDataModel> list = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                  child: GridView.builder(
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Text(list[index].id!),
                          Text(list[index].hospitalName!),
                          Text(list[index].bloodPressure!),
                          Text(list[index].age!),
                          Text(list[index].oxygenLvl!),
                          Text(list[index].temperature!),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 5 / 3
                    // crossAxisSpacing: 5.0,
                    // mainAxisSpacing: 5.0,
                    ),
              ));
            } else {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future fetchData() async {
    List<UserDataModel> list = [];
    final ref = FirebaseDatabase.instance.ref();
    DataSnapshot snapshot = await ref.child('users/').get();
    //  print(snapshot.value.toString());
    Map<dynamic, dynamic> lists = snapshot.value as Map<dynamic, dynamic>;
    //  print(lists.values.toList());
    lists.forEach((key, value) {
      print(value.toString());
      UserDataModel data = UserDataModel.fromJson({
        'oxygen_lvl': value['oxygen_lvl'],
        'temperature': value['temperature'],
        'file_link': value['file_link'],
        'blood_pressure': value['blood_pressure'],
        'id': value['id'],
        'patient_age': value['patient_age'],
        'hospital_name': value['hospital_name'],
        'age': value['age']
      });
      print(data.id);
      list.add(data);
    });
    return list;
  }
}
