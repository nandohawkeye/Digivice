import 'package:digivice/src/shared/abstracts/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

class ErrorHomeWidget extends StatelessWidget {
  const ErrorHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationConfiguration.synchronized(
        child: FadeInAnimation(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 250,
                  width: 250,
                  child: Lottie.asset(AssetsPaths.animError)),
              const SizedBox(height: 12),
              const Text('Ocorreu um erro ao buscar Digimons!',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}
