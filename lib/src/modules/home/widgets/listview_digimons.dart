import 'package:digivice/src/modules/home/widgets/digimon_card.dart';
import 'package:digivice/src/modules/home/widgets/label_digimon_level.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';

class ListViewDigimons extends StatelessWidget {
  const ListViewDigimons(
      {Key? key, required this.digimons, required this.label})
      : super(key: key);

  final List<DigimonModel>? digimons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return digimons == null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelDigimonLevel(label: label),
              const _ListviewLoading()
            ],
          )
        : digimons!.isEmpty
            ? const SizedBox.shrink()
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelDigimonLevel(label: label),
                  SizedBox(
                    height: 290,
                    child: NotificationListener<OverscrollNotification>(
                      onNotification: (notification) =>
                          notification.metrics.axisDirection !=
                          AxisDirection.left,
                      child: ListView.separated(
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 20),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20),
                          itemCount: digimons!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) =>
                              DigimonCard(data: digimons![index])),
                    ),
                  ),
                ],
              );
  }
}

class _ListviewLoading extends StatelessWidget {
  const _ListviewLoading({Key? key}) : super(key: key);

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
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
                  position: index,
                  child: const _ItenLoading(),
                )),
      )),
    );
  }
}

class _ItenLoading extends StatelessWidget {
  const _ItenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            )),
      ),
    );
  }
}
