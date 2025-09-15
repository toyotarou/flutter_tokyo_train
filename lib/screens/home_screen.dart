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
      appBar: AppBar(
        title: Text('Tokyo Train List'),

        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.stacked_line_chart))],
      ),

      body: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 12),

          child: Column(children: [Expanded(child: displayTokyoTrainList())]),
        ),
      ),
    );
  }

  ///
  Widget displayTokyoTrainList() {
    final List<Widget> list = <Widget>[];

    for (var element in appParamState.keepTokyoTrainList) {
      List<Widget> list2 = <Widget>[];

      for (var element2 in element.station) {
        list2.add(
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.2))),
            ),

            padding: EdgeInsets.all(2),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(element2.stationName),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text(element2.lat.toString()), Text(element2.lng.toString())],
                ),
              ],
            ),
          ),
        );
      }

      list.add(
        Stack(
          children: [
            Container(height: 70, decoration: BoxDecoration(color: Colors.yellowAccent.withValues(alpha: 0.1))),

            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white.withValues(alpha: 0.2))),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(element.trainName),

                      IconButton(onPressed: () {}, icon: Icon(Icons.stacked_line_chart)),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      SizedBox(width: 50),

                      Expanded(child: Column(children: list2)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
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
