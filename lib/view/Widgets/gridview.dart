import 'package:animation3d/core/models/model.dart';
import 'package:animation3d/view/screen/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget
{
  final model;
  final Size size;
  final bool scale;
  GridViewWidget
  (
    {
      Key key ,
      this.model,
      this.scale,
      this.size
    }
  ) : super (key: key);
  @override 
  _GridViewWidget createState() => _GridViewWidget();
}

class _GridViewWidget extends State<GridViewWidget>
{
  Offset _offset;
  @override 
  Widget build(BuildContext context)
  {
    //final model = Provider.of<FloorPlanModel>(context);
    return GridView.builder
    (
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
      (
        crossAxisCount: 3
      ),
      itemCount: 9,
      shrinkWrap: true,
      itemBuilder: (context, index) 
      {
        int currentTile = index + 1 ;
        List<Light> titleLights = this.widget.model.lights.where
        (
          (element) => element.tile ==currentTile
        ).toList();

        return Stack
        (
          alignment: Alignment.center ,
          children: <Widget>
          [
            Container
            (
              color: Colors.lightBlue,
              child: Image.asset("lib/assets/images/tile_0$currentTile.png"),
            ),
            titleLights.length == 0
            ? SizedBox()
            : Center
            (
              child: this.widget.scale
              ? Stack
              (
                children: List.generate(titleLights.length, (i) 
                {
                  return GestureDetector
                  (
                    onTap: () 
                    {
                      titleLights[i].status
                      ? Navigator.push
                      (
                        context, 
                        MaterialPageRoute
                        (
                          builder: (context) => DetailScreen(),
                        )
                      )
                      : print("object");
                    },
                    child: Transform.translate
                    (
                      offset: Offset
                      (
                        this.widget.size.width *titleLights[i].position[0],
                        this.widget.size.width *titleLights[i].position[1],
                      ),
                      child: Stack
                      (
                        alignment: Alignment.center,
                        children: <Widget>
                        [
                          CircleAvatar
                          (
                            radius: 5.0,
                            backgroundColor: titleLights[i].status
                            ? Colors.greenAccent 
                            : Colors.white,
                            child: Center
                            (
                              child: Icon
                              (
                                Icons.lightbulb_outline,
                                color: Colors.lightBlue,
                                size: 7,
                              ),
                            )
                          ),
                          Transform
                          (
                            transform: Matrix4.identity()..translate(18.0),
                            child: Center
                            (
                              child: Text
                              (
                                titleLights[i].name ,
                                style: TextStyle
                                (
                                  fontSize: 6.0,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
              : CircleAvatar
              (
                backgroundColor: Colors.white,
                child: Text
                (
                  "${titleLights.length}",
                  style: TextStyle
                  (
                    color: Colors.lightBlue
                  ),
                ),
              ),
            )
          ],
        );
      },

    );
  }
}