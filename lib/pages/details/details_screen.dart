import 'package:adventure/models/adventure_place.dart';
import 'package:adventure/theme/colors.dart';
import 'package:adventure/theme/typography.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});
  final AdventurePlace place;

  @override
  Widget build(BuildContext context) {
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
                tag: place.id,
                child: Image.asset(
                  place.image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                )),
          ),
          Positioned.fill(child: PlaceDetails(place: place)),
          JourneyDetails(place: place)
        ]));
  }
}

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({
    super.key,
    required this.place,
  });

  final AdventurePlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.transparent,
            getColorScheme(context).background.withOpacity(0.5),
            getColorScheme(context).background.withOpacity(0.8)
          ])),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(place.name, style: textTheme.headlineLarge),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_pin, size: 15, color: Colors.red),
              const SizedBox(width: 2),
              Text(place.location, style: textTheme.labelLarge),
              const SizedBox(width: 10),
              const Icon(Icons.run_circle_outlined,
                  size: 15, color: Colors.blue),
              const SizedBox(width: 2),
              Text(place.activity, style: textTheme.labelLarge)
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 15),
              const SizedBox(width: 2),
              Text("${place.rating} Reviews", style: textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: 8),
          Text(place.about, style: textTheme.bodySmall),
          const SizedBox(height: 8),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map_sharp, size: 15),
              label: Text("View Map", style: textTheme.labelLarge)),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Slide up see details",
                style: textTheme.bodySmall,
              )),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

class JourneyDetails extends StatefulWidget {
  const JourneyDetails({super.key, required this.place});
  final AdventurePlace place;

  @override
  State<JourneyDetails> createState() => _JourneyDetailsState();
}

class _JourneyDetailsState extends State<JourneyDetails> {
  final GlobalKey _containerKey = GlobalKey();
  double value = 50;

  double getHeight() {
    final RenderBox renderBox =
        _containerKey.currentContext?.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      left: 0,
      right: 0,
      top: screenHeight - value,
      child: GestureDetector(
        key: _containerKey,
        onVerticalDragUpdate: (details) {
          setState(() {
            details.delta.dy > 0 ? value = 50.0 : value = getHeight();
          });
        },
        child: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 10),
              AnimatedCrossFade(
                firstChild: const Icon(Icons.keyboard_arrow_up),
                secondChild: const Icon(Icons.linear_scale),
                crossFadeState: value == 50
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
              const SizedBox(height: 15),
              const Text("Journey Details"),
              Text(widget.place.about),
              Table(
                children: [
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_pin),
                          const Text("Route"),
                          Text("${widget.place.route} Km")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_pin),
                          const Text("Route"),
                          Text("${widget.place.route} Km")
                        ],
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_pin),
                          const Text("Route"),
                          Text("${widget.place.route} Km")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_pin),
                          const Text("Route"),
                          Text("${widget.place.route} Km")
                        ],
                      )
                    ],
                  )
                ],
              ),
              InkWell(
                splashColor: Colors.amber,
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: getColorScheme(context).onBackground,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Book a flight",
                    style: textTheme.labelLarge?.merge(
                        TextStyle(color: getColorScheme(context).background)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
