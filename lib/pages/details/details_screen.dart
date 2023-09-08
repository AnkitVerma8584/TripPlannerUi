import 'dart:ui';
import 'package:adventure/models/adventure_place.dart';
import 'package:adventure/pages/details/sections/journey_details.dart';
import 'package:adventure/pages/details/sections/place_details.dart';
import 'package:adventure/theme/colors.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final AdventurePlace place;

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
              opacity: value == 50 ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: PlaceDetails(place: widget.place),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: value,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: getSurfaceColor(context, opacity: 0.5),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: 0,
              right: 0,
              top: screenHeight - value,
              child: JourneyDetails(
                  isDisplayed: value != 50,
                  place: widget.place,
                  onHeightChange: (val) => setState(() => value = val)))
        ]));
  }
}
