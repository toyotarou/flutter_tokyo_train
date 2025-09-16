import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/controllers_mixin.dart';
import '../models/tokyo_train_model.dart';
import 'components/train_map_alert.dart';
import 'parts/tokyo_train_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.tokyoTrainList, required this.tokyoStationMap});

  final List<TokyoTrainModel> tokyoTrainList;
  final Map<String, List<TokyoStationModel>> tokyoStationMap;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  List<String> selectedTrainName = <String>[];

  ///
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      appParamNotifier.setKeepTokyoTrainList(list: widget.tokyoTrainList);
      appParamNotifier.setKeepTokyoStationMap(map: widget.tokyoStationMap);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokyo Train List'),

        actions: <Widget>[
          IconButton(
            onPressed: () {
              appParamNotifier.setJrJogaiFlag();
            },
            icon: Icon(
              FontAwesomeIcons.sun,
              color: (appParamState.jrJogaiFlag) ? Colors.yellowAccent : Colors.white.withValues(alpha: 0.2),
            ),
          ),

          IconButton(
            onPressed: () {
              TokyoTrainDialog(
                context: context,
                widget: TrainMapAlert(selectedTrainName: selectedTrainName),
              );
            },
            icon: const Icon(Icons.stacked_line_chart),
          ),
        ],
      ),

      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 12),

          child: Column(children: <Widget>[Expanded(child: displayTokyoTrainList())]),
        ),
      ),
    );
  }

  ///
  Widget displayTokyoTrainList() {
    final List<Widget> list = <Widget>[];

    for (final TokyoTrainModel element in appParamState.keepTokyoTrainList) {
      bool flag = true;

      if (appParamState.jrJogaiFlag) {
        final RegExp reg = RegExp('JR');
        final RegExp reg2 = RegExp('新幹線');

        if (reg.firstMatch(element.trainName) != null || reg2.firstMatch(element.trainName) != null) {
          flag = false;
        }
      }

      if (flag) {
        final List<Widget> list2 = <Widget>[];

        for (final TokyoStationModel element2 in element.station) {
          list2.add(
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.2))),
              ),

              padding: const EdgeInsets.all(2),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(element2.stationName),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[Text(element2.lat.toString()), Text(element2.lng.toString())],
                  ),
                ],
              ),
            ),
          );
        }

        list.add(
          Stack(
            children: <Widget>[
              Container(height: 70, decoration: BoxDecoration(color: Colors.yellowAccent.withValues(alpha: 0.1))),

              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.white.withValues(alpha: 0.2))),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),

                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(element.trainName),

                        IconButton(
                          onPressed: () {
                            TokyoTrainDialog(
                              context: context,
                              widget: TrainMapAlert(trainModel: element),
                            );
                          },
                          icon: const Icon(Icons.stacked_line_chart),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: <Widget>[
                        const SizedBox(width: 50),

                        Expanded(child: Column(children: list2)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

        selectedTrainName.add(element.trainName);
      }
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => list[index],
            childCount: list.length,
          ),
        ),
      ],
    );
  }
}
