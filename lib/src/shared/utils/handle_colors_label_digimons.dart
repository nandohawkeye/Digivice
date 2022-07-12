import 'package:digivice/src/modules/home/abstracts/level_digimons.dart';
import 'package:flutter/material.dart';

Color handleColorsLabelDigimons(String value) {
  if (value == LevelDigimons.fresh) {
    return Colors.amber;
  } else if (value == LevelDigimons.inTraining) {
    return Colors.blueAccent;
  } else if (value == LevelDigimons.training) {
    return Colors.lightBlue;
  } else if (value == LevelDigimons.rookie) {
    return Colors.green;
  } else if (value == LevelDigimons.champion) {
    return Colors.orange;
  } else if (value == LevelDigimons.armor) {
    return Colors.grey;
  } else if (value == LevelDigimons.ultimate) {
    return Colors.black87;
  } else {
    return Colors.red;
  }
}
