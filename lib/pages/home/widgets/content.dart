import 'package:adventure/models/places.dart';
import 'package:adventure/pages/details/details_screen.dart';
import 'package:adventure/pages/home/widgets/image_card.dart';
import 'package:flutter/material.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: placesList.length,
      controller: _pageController,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) =>
                      PlaceDetailsScreen(place: placesList[index])));
            },
            child: ImageCard(place: placesList[index]));
      },
    );
  }
}
