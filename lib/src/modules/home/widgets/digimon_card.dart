import 'package:cached_network_image/cached_network_image.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DigimonCard extends StatelessWidget {
  const DigimonCard({Key? key, required this.data}) : super(key: key);

  final DigimonModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 15,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl: data.image,
            height: 200,
            width: 200,
            errorWidget: (_, __, ___) => const _Error(),
            placeholder: (_, __) => const _Loading(),
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8)),
            child: Text(data.name,
                style: const TextStyle(fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(10),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: const Icon(Icons.close),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          )),
    );
  }
}
