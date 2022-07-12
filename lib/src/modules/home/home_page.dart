import 'package:digivice/src/modules/home/abstracts/level_digimons.dart';
import 'package:digivice/src/modules/home/home_controller.dart';
import 'package:digivice/src/modules/home/widgets/error_home_widget.dart';
import 'package:digivice/src/modules/home/widgets/header_home_page.dart';
import 'package:digivice/src/modules/home/widgets/listview_digimons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.getAllDigimons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const HeaderHomePage(),
          Obx(() => _controller.failure != null
              ? const Expanded(child: ErrorHomeWidget())
              : Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => _controller.getAllDigimons(),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListViewDigimons(
                          label: LevelDigimons.fresh,
                          digimons: _controller.digimonsFresh,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.inTraining,
                          digimons: _controller.digimonsInTraining,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.training,
                          digimons: _controller.digimonsTraining,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.rookie,
                          digimons: _controller.digimonsRookie,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.champion,
                          digimons: _controller.digimonsChampion,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.armor,
                          digimons: _controller.digimonsArmor,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.ultimate,
                          digimons: _controller.digimonsUltimate,
                        ),
                        ListViewDigimons(
                          label: LevelDigimons.mega,
                          digimons: _controller.digimonsMega,
                        )
                      ],
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
