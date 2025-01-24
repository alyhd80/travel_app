import 'package:flutter/material.dart';
import 'package:travel_app/data/local/app_data.dart';

class TravelPhotoDetailWidget extends StatefulWidget {
  final TravelPhoto travelPhoto;

  const TravelPhotoDetailWidget({super.key, required this.travelPhoto});

  @override
  State<TravelPhotoDetailWidget> createState() => _TravelPhotoDetailWidgetState();
}

class _TravelPhotoDetailWidgetState extends State<TravelPhotoDetailWidget>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _movement=-100;
  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 10));
_controller.repeat(reverse: true);

    super.initState();
  }

@override
  void dispose() {
    // TODO: implement dispose
  _controller.dispose() ;
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
builder: (context,_){
        return Stack(

          fit: StackFit.expand,
          children: [
            Positioned.fill(
                left: _movement*_controller.value,
                right: _movement*(1-_controller.value),
                child: Image.asset(
                  widget.travelPhoto.backImage,
                  fit: BoxFit.cover,
                )),
            Positioned(
                top: 40,
                left: 0,
                right: 10,
                height: 100,
                child: FittedBox(
                  child: Text(
                    widget.travelPhoto.name,
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        );
},
    );
  }
}
