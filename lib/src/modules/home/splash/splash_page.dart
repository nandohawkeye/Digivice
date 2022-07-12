import 'package:digivice/src/shared/abstracts/assets_paths.dart';
import 'package:digivice/src/shared/abstracts/hero_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SpalshPage extends StatelessWidget {
  const SpalshPage({Key? key}) : super(key: key);

  void jumpToHome() async => await Future.delayed(const Duration(seconds: 1))
      .then((_) => Modular.to.navigate('/home'));

  @override
  Widget build(BuildContext context) {
    jumpToHome();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      body: Hero(
        tag: HeroTags.logo,
        child: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: AnimationConfiguration.synchronized(
              child: FadeInAnimation(
                  child: Image.asset(AssetsPaths.logo, width: 250))),
        ),
      ),
    );
  }
}
