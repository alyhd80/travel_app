import 'package:flutter/material.dart';
import 'package:travel_app/screen/travel_photos_home/component/travel_photos_home_body.dart';

class TravelPhotosHomePage extends StatelessWidget {
  const TravelPhotosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: TravelPhotosHomeBody()),
    );
  }
}
