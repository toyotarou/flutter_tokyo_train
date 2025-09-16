import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/tokyo_train_model.dart';
import '../../utility/utility.dart';

part 'app_param.freezed.dart';

part 'app_param.g.dart';

@freezed
class AppParamState with _$AppParamState {
  const factory AppParamState({
    @Default(<TokyoTrainModel>[]) List<TokyoTrainModel> keepTokyoTrainList,

    @Default(<String, List<TokyoStationModel>>{}) Map<String, List<TokyoStationModel>> keepTokyoStationMap,

    ///
    @Default(0) double currentZoom,
    @Default(5) int currentPaddingIndex,

    ///
    @Default(false) bool jrJogaiFlag,
  }) = _AppParamState;
}

@riverpod
class AppParam extends _$AppParam {
  final Utility utility = Utility();

  ///
  @override
  AppParamState build() => const AppParamState();

  ///
  void setKeepTokyoTrainList({required List<TokyoTrainModel> list}) => state = state.copyWith(keepTokyoTrainList: list);

  ///
  void setKeepTokyoStationMap({required Map<String, List<TokyoStationModel>> map}) =>
      state = state.copyWith(keepTokyoStationMap: map);

  //===================================================

  ///
  void setCurrentZoom({required double zoom}) => state = state.copyWith(currentZoom: zoom);

  ///
  void setJrJogaiFlag() {
    if (state.jrJogaiFlag) {
      state = state.copyWith(jrJogaiFlag: false);
    } else {
      state = state.copyWith(jrJogaiFlag: true);
    }
  }
}
