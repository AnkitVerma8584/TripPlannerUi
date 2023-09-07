import 'package:adventure/pages/home/widgets/content.dart';
import 'package:adventure/pages/home/widgets/header.dart';
import 'package:adventure/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Explore",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.merge(const TextStyle(fontSize: 20)),
          ),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
            elevation: 0,
            indicatorColor: getColorScheme(context).onBackground,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: getColorScheme(context).background,
                  ),
                  label: "Home"),
              const NavigationDestination(
                  icon: Icon(Icons.message), label: "Message"),
              const NavigationDestination(
                  icon: Icon(Icons.label), label: "Label"),
              const NavigationDestination(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
        body: const ExplorePage(),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [HomeScreenHeader(), Expanded(child: HomeScreenContent())],
    );
  }
}
