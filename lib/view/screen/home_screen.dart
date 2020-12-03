
import 'package:animation3d/core/viewmodels/floorplan_model.dart';
import 'package:animation3d/view/Widgets/appbar.dart';
import 'package:animation3d/view/Widgets/gridview.dart';
import 'package:animation3d/view/Widgets/rawGesturedetectorWidget.dart';
import 'package:animation3d/view/Widgets/swipeview.dart';
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
    final _images = ["https://lorempixel.com/640/480/sports","https://lorempixel.com/640/480/sports"];
    final model = Provider.of<FloorPlanModel>(context);
    final Size size = MediaQuery.of(context).size;
    bool _scale = false;
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: PreferredSize
      (
        preferredSize: Size.fromHeight(100.0),
        child: AppbarWidget()
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: () =>
        {
          model.reset()
        },
        child: Icon
        (
          Icons.refresh
        ),
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
          color: Colors.lightBlue,
          child: Column
          (
            children: <Widget>
            [
              Container
              (
                height: size.height * 0.25,

                child: SwipeViewWidget
                (
                  itemsWidth : size.width,
                  swipeList: _images,
                ),
              ),
              Container
              (
                
                height: size.height * 0.5,
                child: Center
                (
                  child :RawGestureDetectorWidget
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
                )
              )
                // child :RawGestureDetectorWidget
                // (
                //   size: size,
                //   model: model,
                //   child:  GridViewWidget
                //   (
                //     size: size,
                //     model : model,
                //     scale : model.isScaled,
                //   ),
                // ),
            ],
          )
        ),
      )
    );
  }
}
