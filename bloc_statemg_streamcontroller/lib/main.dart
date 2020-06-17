import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  ColorBloc  bloc = ColorBloc();
  
  @override
  void dispose(){
    bloc.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = ColorBloc();
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
            backgroundColor: Colors.black,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_black);
            },),
            SizedBox(width: 10,),
            FloatingActionButton(
              onPressed: (){
                bloc.eventSink.add(ColorEvent.to_red);
              },
            backgroundColor: Colors.red,
            )
          ],
        ),
             appBar: AppBar(title: Text("Rudi Barus-20170801321"),),
          body: Center(
             child: StreamBuilder(
               stream: bloc.stateStream,
               initialData: Colors.black,
               builder: (context, snapshot) {
                 return AnimatedContainer(
                   duration: Duration(milliseconds: 500),
                   width: 100,
                   height: 100,
                   color: snapshot.data,
                 );
               },
             ),
          ),
      ),
    );
  }
}

