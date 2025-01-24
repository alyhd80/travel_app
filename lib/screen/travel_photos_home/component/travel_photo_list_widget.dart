import 'package:flutter/material.dart';
import 'package:travel_app/data/local/app_data.dart';
import 'package:travel_app/screen/travel_photos_home/component/travel_photo_list_item_widget.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class TravelPhotoListWidget extends StatefulWidget {
  final ValueChanged<TravelPhoto>onPhotoSelected;
  const TravelPhotoListWidget({super.key, required this.onPhotoSelected});

  @override
  State<TravelPhotoListWidget> createState() => _TravelPhotoListWidgetState();
}

class _TravelPhotoListWidgetState extends State<TravelPhotoListWidget> {
  final _animatedListKey = GlobalKey<AnimatedListState>();
  final _pageController = PageController();
  double page = 0.0;

  void _listenScroll() {
    setState(() {
      page = _pageController.page!;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _animatedListKey,
      controller: _pageController,
      physics: PageScrollPhysics(),
      itemBuilder: (context, index, animation) {
        final travelPhoto = travelPhotos[index];
        final percent = page - page.floor();
        final factor = percent > 0.5 ? (1 - percent) : percent;
        return GestureDetector(
          onTap: () {
            travelPhotos.insert(travelPhotos.length, travelPhoto);
            _animatedListKey.currentState!.insertItem(travelPhotos.length - 1);

            final itemToDelete = travelPhotos;
            widget.onPhotoSelected(travelPhoto);
            travelPhotos.removeAt(index);

            _animatedListKey.currentState!.removeItem(
                index,
                (context, animation) => FadeTransition(
                      opacity: animation,
                      child: SizeTransition(
                          sizeFactor: animation,
                          axis: Axis.horizontal,
                          child: TravelPhotoListItemWidget(
                              travelPhoto: travelPhoto)),
                    ));
          },
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(vector.radians(90 * factor)),
            child: TravelPhotoListItemWidget(
              travelPhoto: travelPhoto,
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      initialItemCount: travelPhotos.length,
    );
  }
}
