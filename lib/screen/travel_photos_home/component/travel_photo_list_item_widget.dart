import 'package:flutter/material.dart';
import 'package:travel_app/data/local/app_data.dart';

class TravelPhotoListItemWidget extends StatelessWidget {
  final TravelPhoto travelPhoto;
  const TravelPhotoListItemWidget({super.key, required this.travelPhoto});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
        width: 130,
          child: Stack(
            fit: StackFit.expand,

            children: [
              Positioned.fill(child: Image.asset(travelPhoto.frontImage,fit: BoxFit.cover,)),
              Positioned.fill(bottom: 10,child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    Text(travelPhoto.name,style: TextStyle(color: Colors.white),),

                    Text("${travelPhoto.photos} photos",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
