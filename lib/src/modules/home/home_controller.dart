import 'package:digivice/src/modules/home/abstracts/level_digimons.dart';
import 'package:digivice/src/modules/home/home_service.dart';
import 'package:digivice/src/shared/failures/failure.dart';
import 'package:digivice/src/shared/models/digimon_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._service);

  final HomeService _service;

  final Rx<List<DigimonModel>?> _digimons = Rx<List<DigimonModel>?>(null);

  List<DigimonModel>? get digimons => _digimons.value;

  List<DigimonModel>? get digimonsInTraining => _digimons.value
      ?.where((element) => element.level == LevelDigimons.inTraining)
      .toList();

  List<DigimonModel>? get digimonsTraining => _digimons.value
      ?.where((element) => element.level == LevelDigimons.training)
      .toList();

  List<DigimonModel>? get digimonsRookie => _digimons.value
      ?.where((element) => element.level == LevelDigimons.rookie)
      .toList();

  List<DigimonModel>? get digimonsFresh => _digimons.value
      ?.where((element) => element.level == LevelDigimons.fresh)
      .toList();

  List<DigimonModel>? get digimonsChampion => _digimons.value
      ?.where((element) => element.level == LevelDigimons.champion)
      .toList();

  List<DigimonModel>? get digimonsArmor => _digimons.value
      ?.where((element) => element.level == LevelDigimons.armor)
      .toList();

  List<DigimonModel>? get digimonsMega => _digimons.value
      ?.where((element) => element.level == LevelDigimons.mega)
      .toList();

  List<DigimonModel>? get digimonsUltimate => _digimons.value
      ?.where((element) => element.level == LevelDigimons.ultimate)
      .toList();

  final Rx<Failure?> _failure = Rx<Failure?>(null);
  Failure? get failure => _failure.value;

  void getAllDigimons() async {
    await _service.getDigimons().then(
        (result) => result.fold((failure) => _failure.value = failure, (data) {
              _digimons.value = data;
            }));
  }
}
