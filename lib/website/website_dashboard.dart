import 'package:finalproject/datamodel/user_datamodel.dart';
import 'package:finalproject/website/user_data_source.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WebsiteDashboard extends StatefulWidget {
  const WebsiteDashboard({super.key});

  @override
  State<WebsiteDashboard> createState() => _WebsiteDashboardState();
}

class _WebsiteDashboardState extends State<WebsiteDashboard> {
  List<UserDataModel> userdata = <UserDataModel>[];
  late UserDataSource userDataSource;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SfDataGrid(
                  source: userDataSource,
                  columnWidthMode: ColumnWidthMode.fill,
                  columns: <GridColumn>[
                    GridColumn(
                        columnName: 'c1',
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Text(
                              'ID',
                            ))),
                    GridColumn(
                        columnName: 'c2',
                        label: Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Name'))),
                    GridColumn(
                        columnName: 'c3',
                        label: Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Designation',
                              overflow: TextOverflow.ellipsis,
                            ))),
                    GridColumn(
                        columnName: 'c4',
                        label: Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: Text('Salary'))),
                  ],
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
      setState(() {
        print(list.toString());
        userDataSource = UserDataSource(usersource: list);
      });
    });
    return list;
  }
}
