import 'package:flutter/material.dart';
import 'package:travel_app/screen/travel_photos_home/component/travel_photo_list_widget.dart';

class TravelPhotosHomeBody extends StatelessWidget {
  const TravelPhotosHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final topCardHeight = size.height / 2;
    final horizontalListHeight = 160.0;
    return Stack(
      children: [
        Positioned(
            height: size.height / 2, left: 0, right: 0, child: Placeholder()),
        Positioned(
            top: topCardHeight - horizontalListHeight / 2,
            left: 0,
            right: 0,
            height: horizontalListHeight,
            child: TravelPhotoListWidget()),
      ],
    );
  }
}
