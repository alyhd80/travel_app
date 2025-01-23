import 'package:flutter/material.dart';

class TravelPhotoListItemWidget extends StatelessWidget {
  final int index;
  const TravelPhotoListItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      color: Colors.primaries[index% Colors.primaries.length],
        width: 130,
      ),
    );
  }
}
