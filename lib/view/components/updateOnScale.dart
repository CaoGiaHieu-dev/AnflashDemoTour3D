import 'package:flutter/cupertino.dart';

class UpdateOnScale extends InheritedWidget
{
  final bool isScale ;
  
  UpdateOnScale
  (
    {
      Key key,
      @required this.isScale,
      @required Widget child
    }
  ) : assert(child !=null),
      assert(isScale!=null),
      super(key : key , child : child);

  static UpdateOnScale of(BuildContext context)
  {
    return context.dependOnInheritedWidgetOfExactType<UpdateOnScale>();
  }

  @override
  bool updateShouldNotify(UpdateOnScale oldWidget)
  {
    return isScale != oldWidget.isScale ;
    //return true;
  }

}