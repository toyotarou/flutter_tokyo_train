import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tokyo_station/models/tokyo_train_model.dart';

import '../../../data/http/client.dart';
import '../../../data/http/path.dart';
import '../../../extensions/extensions.dart';
import '../../../utility/utility.dart';

part 'tokyo_train.freezed.dart';

part 'tokyo_train.g.dart';

@freezed
class TokyoTrainState with _$TokyoTrainState {
  const factory TokyoTrainState({@Default(<TokyoTrainModel>[]) List<TokyoTrainModel> tokyoTrainList}) =
      _TokyoTrainState;
}

@Riverpod(keepAlive: true)
class TokyoTrain extends _$TokyoTrain {
  final Utility utility = Utility();

  @override
  TokyoTrainState build() => const TokyoTrainState();

  //============================================== api

  ///
  Future<TokyoTrainState> fetchAllTokyoTrainData() async {
    final HttpClient client = ref.read(httpClientProvider);

    try {
      List<TokyoTrainModel> list = <TokyoTrainModel>[];

      // ignore: always_specify_types
      await client.post(path: APIPath.getTokyoTrainStation).then((value) {
        // ignore: avoid_dynamic_calls
        for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
          // ignore: avoid_dynamic_calls
          final TokyoTrainModel val = TokyoTrainModel.fromJson(value['data'][i] as Map<String, dynamic>);

          list.add(val);
        }
      });

      return state.copyWith(tokyoTrainList: list);
    } catch (e) {
      utility.showError('予期せぬエラーが発生しました');
      rethrow; // これにより呼び出し元でキャッチできる
    }
  }

  ///
  Future<void> getAllTokyoTrainData() async {
    try {
      final TokyoTrainState newState = await fetchAllTokyoTrainData();

      state = newState;
    } catch (_) {}
  }

  //============================================== api
}
