import 'package:flutter/material.dart';
import 'package:travel_app/data/local/app_data.dart';
import 'package:travel_app/screen/travel_photos_home/component/travel_photo_list_item_widget.dart';

class TravelPhotoListWidget extends StatelessWidget {
  const TravelPhotoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
      final item=itemDataList[index];

      return TravelPhotoListItemWidget(index: index,);
      },
      scrollDirection: Axis.horizontal,
      itemCount: itemDataList.length,
    );
  }
}
