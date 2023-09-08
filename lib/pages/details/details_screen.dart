import 'package:adventure/models/adventure_place.dart';
import 'package:adventure/pages/details/sections/blurr_container.dart';
import 'package:adventure/pages/details/sections/journey_details.dart';
import 'package:adventure/pages/details/sections/place_details.dart';
import 'package:adventure/pages/details/utils/constants.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final AdventurePlace place;

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  double value = MIN_HEIGHT;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.new_label)),
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          Positioned.fill(
            child: Hero(
                tag: widget.place.id,
                child: Image.asset(
                  widget.place.image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                )),
          ),
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: value == MIN_HEIGHT ? 1 : 0,
              duration: ANIMATION_DURATION,
              child: PlaceDetails(place: widget.place),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BlurredContainer(
                value: value, height: value == MIN_HEIGHT ? 0 : MIN_HEIGHT),
          ),
          AnimatedPositioned(
              duration: ANIMATION_DURATION,
              left: 0,
              right: 0,
              top: screenHeight - value,
              child: JourneyDetails(
                  isDisplayed: value != MIN_HEIGHT,
                  place: widget.place,
                  onHeightChange: (val) => setState(() => value = val)))
        ]));
  }
}
