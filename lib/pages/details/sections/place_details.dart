import 'package:adventure/models/adventure_place.dart';
import 'package:adventure/theme/colors.dart';
import 'package:adventure/theme/typography.dart';
import 'package:flutter/material.dart';

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
            getSurfaceColor(context, opacity: 0.5)
          ],
              stops: const [
            0.5,
            0.6
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
