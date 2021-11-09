import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_2_try/main_view/home.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'reducers.dart';
import 'states.dart';

void main() {
  final Store<StatusState> store = Store<StatusState>(statusReducer, initialState: StatusState.empty);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<StatusState> store;
  const MyApp(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<StatusState>(
      store: store,
      child: MaterialApp(
        title: 'Xbox Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
