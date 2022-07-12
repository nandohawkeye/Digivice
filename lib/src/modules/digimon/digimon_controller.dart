import 'package:digivice/src/shared/abstracts/i_share_service.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';

class DigimonController {
  final IShareService shareService;

  DigimonController(this.shareService);

  void shareDigimon(DigimonModel digimon) async =>
      await shareService.share(digimon.image, digimon.name);
}
