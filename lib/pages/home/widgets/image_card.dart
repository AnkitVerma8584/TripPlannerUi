import 'package:adventure/models/adventure_place.dart';
import 'package:adventure/pages/home/util/parallax_horixontal.dart';
import 'package:adventure/theme/colors.dart';
import 'package:adventure/theme/typography.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key, required this.place});
  final AdventurePlace place;

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(children: [
          Positioned.fill(
            child: Flow(
                delegate: ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                  backgroundImageKey: imageKey,
                ),
                children: [
                  Hero(
                    tag: widget.place.id,
                    child: Image.asset(widget.place.image,
                        key: imageKey, fit: BoxFit.cover),
                  ),
                ]),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    stops: const [0.1, 0.2, 0.8],
                    end: Alignment.bottomCenter,
                    colors: [
                      getColorScheme(context).background.withOpacity(0.2),
                      Colors.transparent,
                      getColorScheme(context).background.withOpacity(0.5)
                    ])),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: getColorScheme(context).onBackground),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Hard",
                    style: textTheme.labelLarge,
                  ),
                ),
                const Spacer(),
                Text(widget.place.name,
                    style: textTheme.bodyLarge
                        ?.merge(const TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_pin, size: 15, color: Colors.red),
                    const SizedBox(width: 2),
                    Text(widget.place.location, style: textTheme.labelMedium),
                    const SizedBox(width: 10),
                    const Icon(Icons.run_circle_outlined,
                        size: 15, color: Colors.blue),
                    const SizedBox(width: 2),
                    Text(widget.place.activity, style: textTheme.labelMedium)
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 15),
                    const SizedBox(width: 2),
                    Text("${widget.place.rating} Reviews",
                        style: textTheme.labelMedium),
                  ],
                )
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
