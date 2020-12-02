import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class RawGestureDetectorWidget extends StatefulWidget
{
  final Widget child;
  final model ;
  final Size size ;
  RawGestureDetectorWidget
  (
    {
      Key key,
      @required this.child,
      @required this.model,
      @required this.size
    }
  ) : super(key: key);
  @override 
  _RawGestureDetectorWidget createState() => _RawGestureDetectorWidget();
}

class _RawGestureDetectorWidget extends State<RawGestureDetectorWidget>
{

  @override
  Widget build(BuildContext context)
  {
    
    final _gestures = 
    {
      DragAndScale: GestureRecognizerFactoryWithHandlers<DragAndScale>
      (
        () => DragAndScale(),
        (DragAndScale instance) 
        {
          instance
            ..onStart = (details) 
            {
              this.widget.model.handleDragScaleStart(details);
            }
            ..onUpdate = (details)
            {
              this.widget.model.handleDragScaleUpdate(details);
            }
            ..onEnd = (_) 
            {
              this.widget.model.handleDragScaleEnd();
            };
        },
      )
    };

    final AlignmentGeometry _alignment = FractionalOffset.fromOffsetAndRect
    (
      Offset
      (
        this.widget.size.width / 2.0,
        this.widget.size.height / 2.0,
      ),
      Rect.fromLTRB
      (
        0.0,
        0.0,
        this.widget.size.width,
        this.widget.size.height,
      ),
    );

    final Matrix4 _transform = Matrix4.diagonal3
    (
      Vector3
      (
        this.widget.model.scale,
        this.widget.model.scale,
        this.widget.model.scale,
      ),
    )..translate
    (
      this.widget.model.pos.x,
      this.widget.model.pos.y,
    );

    return RawGestureDetector
    (
      gestures: _gestures,
      child: Container
      (
        child: Transform
        (
          alignment: _alignment,
          transform: _transform,
          child: ScrollConfiguration
          (
            behavior: RemoveScollGlow(),
            child: Padding
            (
              padding: EdgeInsets.all(20.0),
              child: this.widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class DragAndScale extends ScaleGestureRecognizer
{
  @override
  void rejectGesture(int pointer)
  {
    acceptGesture(pointer);
  }
}
class RemoveScollGlow extends ScrollBehavior
{
  @override 
  Widget buildViewportChrome(BuildContext context , Widget child , AxisDirection axisDirection)
  {
    return child;
  }
}