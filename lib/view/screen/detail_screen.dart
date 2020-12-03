import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class DetailScreen extends StatefulWidget
{

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      floatingActionButton: FloatingActionButton
      (
        onPressed: ()
        {
          showDialog
          (
            context: context,
            builder: (context)
            {
              return AlertDialog
              (
                actions: <Widget>
                [
                  RaisedButton
                  (
                    onPressed: () 
                    {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                  ),
                ],
                content: Text
                (
                  "This is content"
                ),
              );
            },
          );
        },
        child: Icon
        (
          Icons.info
        ),
      ),
      appBar: AppBar
      (
      
      ),
      body: Panorama
      (
        animSpeed: 0,
        child: Image.asset("lib/assets/3d_images/temp.jpg"),
      ),
    );
  }
}