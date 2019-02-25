import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/blocs/bloc_counter.dart';
import 'package:flutter_bloc_app/blocs/bloc_provider.dart';
import 'package:flutter_bloc_app/page/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My BLoC Pattern',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          bloc: BlocCounter(),
          child: MyCounterPage(title: 'My BLoC Pattern')),
    );
  }
}
