
import 'package:animation3d/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/floorplan_model.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider
    (
      providers: 
      [
        ChangeNotifierProvider<FloorPlanModel>
        (
          create: (context) => FloorPlanModel()
        ),
      ],
      child:  MaterialApp
      (
        title: 'Flutter Demo',
        theme: ThemeData
        (
          primarySwatch: Colors.blue,
        ),
       home: MyHomePage(),
      )
    );
  }
}

