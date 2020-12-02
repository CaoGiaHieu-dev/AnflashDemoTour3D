import 'package:animation3d/core/viewmodels/floorplan_model.dart';
import 'package:animation3d/view/Widgets/appbar.dart';
import 'package:animation3d/view/Widgets/gridview.dart';
import 'package:animation3d/view/Widgets/rawGesturedetectorWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget 
{

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{
  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) 
  {
    final model = Provider.of<FloorPlanModel>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: PreferredSize
      (
        preferredSize: Size.fromHeight(100.0),
        child: AppbarWidget(),
      ),
      body: ClipRRect
      (
        borderRadius: BorderRadius.only
        (
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        child: Container
        (
          color: Colors.lightBlueAccent,
          child: Center
          (
            child: Stack
            (
              alignment: Alignment.center,
              children: <Widget>
              [
                RawGestureDetectorWidget
                (
                  size: size,
                  model: model,
                  child:  GridViewWidget
                  (
                    size: size,
                    model : model,
                    scale : model.isScaled,
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
