import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_station/controllers/controllers_mixin.dart';
import 'package:tokyo_station/models/tokyo_train_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.tokyoTrainList});

  final List<TokyoTrainModel> tokyoTrainList;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  ///
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      appParamNotifier.setKeepTokyoTrainList(list: widget.tokyoTrainList);
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('HomeScreen'),

            Expanded(child: displayTokyoTrainList()),
          ],
        ),
      ),
    );
  }

  ///
  Widget displayTokyoTrainList() {
    final List<Widget> list = <Widget>[];

    appParamState.keepTokyoTrainList.forEach((element) {
      list.add(Text(element.trainName));
    });

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
