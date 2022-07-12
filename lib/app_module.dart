import 'package:digivice/src/modules/digimon/digimon_controller.dart';
import 'package:digivice/src/modules/digimon/digimon_page.dart';
import 'package:digivice/src/modules/home/home_controller.dart';
import 'package:digivice/src/modules/home/home_page.dart';
import 'package:digivice/src/modules/home/home_service.dart';
import 'package:digivice/src/modules/splash/splash_page.dart';
import 'package:digivice/src/shared/services/http_client.dart';
import 'package:digivice/src/shared/services/share_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(i())),
        Bind.factory((i) => HomeService(i())),
        Bind.factory((i) => HTTPClient()),
        Bind.factory((i) => DigimonController(i())),
        Bind.factory((i) => ShareService()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SpalshPage()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/digimon',
            child: (context, args) => DigimonPage(digimon: args.data)),
      ];
}
