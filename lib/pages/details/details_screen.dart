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
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
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
                    Text(place.name, style: textTheme.headlineLarge),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_pin,
                            size: 15, color: Colors.red),
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
                        Text("${place.rating} Reviews",
                            style: textTheme.labelLarge),
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
                      child: Column(
                        children: [
                          const Text("Swipe up for details"),
                          Container(
                            height: 100,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ]));
  }
}
