import 'package:digivice/src/modules/home/widgets/digimon_card.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({Key? key, required this.digimons}) : super(key: key);

  final List<DigimonModel> digimons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: AnimationLimiter(
          child: NotificationListener<OverscrollNotification>(
        onNotification: (notification) =>
            notification.metrics.axisDirection != AxisDirection.left,
        child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemCount: digimons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: DigimonCard(
                        data: digimons[index],
                      ),
                    ),
                  ),
                )),
      )),
    );
  }
}
