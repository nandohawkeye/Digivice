import 'package:digivice/src/shared/abstracts/assets_paths.dart';
import 'package:digivice/src/shared/abstracts/hero_tags.dart';
import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: HeroTags.logo,
      child: Container(
        color: Colors.blue,
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Image.asset(AssetsPaths.logo, height: 60),
      ),
    );
  }
}
