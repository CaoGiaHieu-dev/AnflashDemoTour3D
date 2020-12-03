import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SwipeViewWidget extends StatefulWidget
{
  final double itemsWidth;
  final List swipeList;
  SwipeViewWidget
  (
    {
      Key key,
      @required this.swipeList,
      this.itemsWidth,
    }
  ):super(key: key);
  @override 
  _SwipeViewWidget createState() => _SwipeViewWidget(); 
}

class _SwipeViewWidget extends State<SwipeViewWidget>
{
  double _itemWidth ;
  int _length;
  @override
  void initState()
  {
    super.initState();
    this.widget.itemsWidth != null
    ? _itemWidth = this.widget.itemsWidth
    : _itemWidth = 300 ;  // defautl items with =300

    _length = this.widget.swipeList.length;
  }

  @override 
  Widget build(BuildContext context)
  {
    return Swiper
    (
      pagination: SwiperPagination(),
      layout: SwiperLayout.STACK,
      itemWidth: _itemWidth,
      itemCount: _length,
      itemBuilder: (context, i) 
      {
        return CachedNetworkImage
        (
          // /fit: BoxFit.fill,
          imageUrl: this.widget.swipeList[i],
          alignment: Alignment.center,
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          imageBuilder: (context, imageProvider) 
          {
            return Container
            (
              margin: EdgeInsets.only
              (
                left : 10,
                right: 10,
                top: 10
              ),
              decoration: BoxDecoration
              (
                borderRadius: BorderRadius.circular(15),
                //shape: BoxShape.circle,
                image: DecorationImage
                (
                  image: imageProvider,
                  fit: BoxFit.cover
                )
              ),
            );
          },
        );
      }
    );
  }
}