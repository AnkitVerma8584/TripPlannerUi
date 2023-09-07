import 'package:adventure/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: GradientText("Deep Dive Into Beautiful Places With Us",
                colors: [
                  getColorScheme(context).primary,
                  getColorScheme(context).tertiary
                ],
                style: Theme.of(context).textTheme.displayMedium),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(50),
            child: Container(
              height: 45 * 3,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: getColorScheme(context).primary, width: 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(CupertinoIcons.search,
                  color: getColorScheme(context).primary),
            ),
          )
        ],
      ),
    );
  }
}
