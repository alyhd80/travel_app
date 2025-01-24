import 'package:flutter/material.dart';
import 'package:travel_app/data/local/app_data.dart';
import 'package:travel_app/screen/travel_photos_home/component/travel_photo_detail.dart';
import 'package:travel_app/screen/travel_photos_home/component/travel_photo_list_widget.dart';

class TravelPhotosHomeBody extends StatefulWidget {
  const TravelPhotosHomeBody({super.key});

  @override
  State<TravelPhotosHomeBody> createState() => _TravelPhotosHomeBodyState();
}

class _TravelPhotosHomeBodyState extends State<TravelPhotosHomeBody> {
  TravelPhoto _selected = travelPhotos.last;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final topCardHeight = size.height / 2;
    final horizontalListHeight = 160.0;
    return Stack(
      children: [
        Positioned(
            height: size.height / 2,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
           duration: Duration(milliseconds: 700),
              child: TravelPhotoDetailWidget(
                key: Key(_selected.name),
                travelPhoto: _selected,
              ),
            )),
        Positioned(
            top: topCardHeight - horizontalListHeight / 2,
            left: 0,
            right: 0,
            height: horizontalListHeight,
            child: TravelPhotoListWidget(onPhotoSelected: (item) {
              setState(() {
                _selected = item;
              });
            })),
      ],
    );
  }
}
