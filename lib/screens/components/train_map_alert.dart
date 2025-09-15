import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/controllers_mixin.dart';
import '../../models/tokyo_train_model.dart';

class TrainMapAlert extends ConsumerStatefulWidget {
  const TrainMapAlert({super.key, this.trainModel});

  final TokyoTrainModel? trainModel;

  @override
  ConsumerState<TrainMapAlert> createState() => _TrainMapAlertState();
}

class _TrainMapAlertState extends ConsumerState<TrainMapAlert> with ControllersMixin<TrainMapAlert> {
  ///
  @override
  void initState() {
    super.initState();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
