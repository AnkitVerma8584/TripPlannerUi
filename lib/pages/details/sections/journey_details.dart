import 'dart:ui';

import 'package:adventure/models/adventure_place.dart';
import 'package:adventure/theme/colors.dart';
import 'package:adventure/theme/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JourneyDetails extends StatelessWidget {
  JourneyDetails(
      {super.key,
      required this.isDisplayed,
      required this.place,
      required this.onHeightChange});

  final bool isDisplayed;
  final AdventurePlace place;
  final GlobalKey containerKey = GlobalKey();
  final Function(double) onHeightChange;

  double getHeight() {
    final RenderBox renderBox =
        containerKey.currentContext?.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: containerKey,
      onVerticalDragUpdate: (details) {
        onHeightChange(details.delta.dy > 0 ? 50 : getHeight());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedCrossFade(
                firstChild: const Icon(Icons.keyboard_arrow_up),
                secondChild: const Icon(Icons.linear_scale),
                crossFadeState: isDisplayed
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Journey Details",
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              place.about,
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            Table(
              children: [
                TableRow(
                  children: [
                    JourneyDetailsTableItem(
                        icon: CupertinoIcons.map_pin_ellipse,
                        label: "Route",
                        data: "${place.route} Km"),
                    JourneyDetailsTableItem(
                        icon: CupertinoIcons.triangle_lefthalf_fill,
                        label: "Highest Point",
                        data: "${place.highestPoint} m")
                  ],
                ),
                TableRow(
                  children: [
                    JourneyDetailsTableItem(
                        icon: CupertinoIcons.time,
                        label: "Total Time",
                        data: place.totalTime),
                    JourneyDetailsTableItem(
                        icon: CupertinoIcons.timer,
                        label: "Difficulty",
                        data: "${place.difficulty}% (Hard)")
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Container(
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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class JourneyDetailsTableItem extends StatelessWidget {
  const JourneyDetailsTableItem({
    super.key,
    required this.icon,
    required this.label,
    required this.data,
  });
  final IconData icon;
  final String label, data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Text(
            label,
            style: textTheme.labelSmall,
          ),
          const SizedBox(height: 5),
          Text(data)
        ],
      ),
    );
  }
}
