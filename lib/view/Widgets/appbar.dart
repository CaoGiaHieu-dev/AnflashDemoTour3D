
import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget
{
  @override 
  _AppbarWidget createState() => _AppbarWidget();
}

class _AppbarWidget extends State<AppbarWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return AppBar
    (
      backgroundColor: Colors.white,
      elevation: 0.0,
      bottom: PreferredSize
      (
        preferredSize: Size.zero,
        child: Column
        (
          children: <Widget>
          [
            Text
            (
              "Anflash 3d demo",
              style: TextStyle
              (
                fontWeight: FontWeight.w900,
                fontSize: 16.0,
                color: Colors.teal
              ),
            ),
            Icon
            (
              Icons.arrow_drop_down
            )
          ],
        ),
      ),
    );
  }
}