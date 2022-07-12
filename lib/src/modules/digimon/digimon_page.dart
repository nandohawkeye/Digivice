import 'package:cached_network_image/cached_network_image.dart';
import 'package:digivice/src/modules/digimon/digimon_controller.dart';
import 'package:digivice/src/modules/digimon/widgets/digimon_page_button.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DigimonPage extends StatelessWidget {
  const DigimonPage({Key? key, required this.digimon}) : super(key: key);

  final DigimonModel digimon;

  @override
  Widget build(BuildContext context) {
    final DigimonController _controller = Modular.get<DigimonController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: InteractiveViewer(
            child: Hero(
                tag: digimon.name,
                child: CachedNetworkImage(imageUrl: digimon.image)),
          )),
          Padding(
            padding: EdgeInsets.only(
                bottom: 20 + MediaQuery.of(context).padding.bottom),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DigimonPageButton(
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                  onTap: () => Modular.to.pop(),
                ),
                const SizedBox(width: 12),
                DigimonPageButton(
                  color: Colors.blue,
                  icon: const Icon(Icons.share, color: Colors.white),
                  onTap: () => _controller.shareDigimon(digimon),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
