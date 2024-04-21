import 'package:finalproject/datamodel/user_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UserDataSource extends DataGridSource {
  List<DataGridRow> _userData = [];

  UserDataSource({required List<UserDataModel> usersource}) {
    _userData = usersource
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'c1', value: e.id),
              DataGridCell<String>(columnName: 'c2', value: e.fileLink),
              DataGridCell<String>(columnName: 'c3', value: e.bloodPressure),
              DataGridCell<String>(columnName: 'c4', value: e.hospitalName),
            ]))
        .toList();
    print(_userData.toString());
  }

  @override
  List<DataGridRow> get rows => _userData;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      print(e.toString());
      return Container(
        color: Colors.amber,
        alignment: Alignment.center,
        // padding: EdgeInsets.all(8.0),
        child: Text(
          'e.value.toString(),',
          style: TextStyle(color: Colors.black),
        ),
      );
    }).toList());
  }
}
