import 'package:digivice/src/modules/home/home_controller.dart';
import 'package:digivice/src/modules/home/home_page.dart';
import 'package:digivice/src/modules/home/home_service.dart';
import 'package:digivice/src/shared/services/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(i())),
        Bind.factory((i) => HomeService(i())),
        Bind.factory((i) => HTTPClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
