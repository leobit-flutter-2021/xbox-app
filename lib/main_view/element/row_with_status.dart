import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../states.dart';
import '../home.dart';
import 'package:lab_2_try/actions.dart' as action;

Widget statusButton(stat, color) {
  return StoreConnector<StatusState, OnStatusChanged>(
    converter: (store) {
      return (status) => store.dispatch(action.OnlineAction(status));
    },
    builder: (context, callback) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(Icons.change_circle, color: color),
          onPressed: () => callback(stat));
    },
  );
}

Widget statusShow() {
  return StoreConnector<StatusState, String>(
    converter: (store) => store.state.status.toString(),
    builder: (context, viewModel) {
      return Center(
        heightFactor: 2,
        child: Text(
            viewModel == 'true' ? 'Online' : 'Offline',
            style: const TextStyle(color: Colors.white, fontSize: 22)),
      );
    },
  );
}

Widget rowWithDescription() {
  return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          statusButton(true, Colors.red),
          statusShow(),
          statusButton(false, Colors.green),
        ],
  );
}