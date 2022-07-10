import 'package:digivice/src/modules/home/home_controller.dart';
import 'package:digivice/src/modules/home/widgets/header_home_page.dart';
import 'package:digivice/src/modules/home/widgets/label_digimon_level.dart';
import 'package:digivice/src/modules/home/widgets/listview_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    _controller.getAllDigimons();
    super.initState();
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
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Obx(() => _controller.digimons == null ||
                        _controller.digimons!.isEmpty
                    ? const SizedBox(
                        height: 400,
                        child: Center(child: CircularProgressIndicator()))
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LabelDigimonLevel(
                            label: 'Fresh',
                            color: Colors.amber,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsFresh!,
                          ),
                          const LabelDigimonLevel(
                            label: 'In Training',
                            color: Colors.blueAccent,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsInTraining!,
                          ),
                          const LabelDigimonLevel(
                            label: 'Training',
                            color: Colors.lightBlue,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsTraining!,
                          ),
                          const LabelDigimonLevel(
                            label: 'Rookie',
                            color: Colors.green,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsRookie!,
                          ),
                          const LabelDigimonLevel(
                            label: 'Champion',
                            color: Colors.orange,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsChampion!,
                          ),
                          const LabelDigimonLevel(
                            label: 'Armor',
                            color: Colors.grey,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsArmor!,
                          ),
                          const LabelDigimonLevel(
                            label: 'Mega',
                            color: Colors.red,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsMega!,
                          ),
                          const LabelDigimonLevel(
                            label: 'Ultimate',
                            color: Colors.black87,
                          ),
                          ListViewHome(
                            digimons: _controller.digimonsUltimate!,
                          ),
                        ],
                      )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
