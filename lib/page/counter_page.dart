import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/blocs/bloc_counter.dart';
import 'package:flutter_bloc_app/blocs/bloc_provider.dart';

class MyCounterPage extends StatefulWidget {
  MyCounterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyCounterPageState createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: counterBloc.counterStreamController.stream,
                initialData: 0,
                builder: (context, snapshot) {
                  print("build.. Text");
                  return Text(snapshot.data.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.incrementCounter(1),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}