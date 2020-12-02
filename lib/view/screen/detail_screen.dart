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