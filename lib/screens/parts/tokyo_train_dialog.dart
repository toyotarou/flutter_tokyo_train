import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: non_constant_identifier_names
Future<void> TokyoTrainDialog({
  required BuildContext context,
  required Widget widget,
  double paddingTop = 0,
  double paddingRight = 0,
  double paddingBottom = 0,
  double paddingLeft = 0,
  bool clearBarrierColor = false,
  bool? executeFunctionWhenDialogClose,
  WidgetRef? ref,
  String? from,
}) {
  // ignore: inference_failure_on_function_invocation
  return showDialog(
    context: context,

    barrierColor: clearBarrierColor ? Colors.transparent : Colors.blueGrey.withValues(alpha: 0.3),
    builder: (_) {
      return Container(
        padding: EdgeInsets.only(top: paddingTop, right: paddingRight, bottom: paddingBottom, left: paddingLeft),
        child: Dialog(
          backgroundColor: Colors.blueGrey.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          insetPadding: const EdgeInsets.all(30),
          child: widget,
        ),
      );
    },
    // ignore: always_specify_types
  ).then((value) {
    // // ignore: use_if_null_to_convert_nulls_to_bools
    // if (executeFunctionWhenDialogClose == true) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (from == 'MoneyDataInputAlert' ||
    //         from == 'MonthlyGeolocMapDisplayAlert' ||
    //         from == 'ToushiShintakuDataUpdateAlert' ||
    //         from == 'LifetimeGeolocMapDisplayAlert') {
    //       if (ref != null) {
    //         closeAllOverlays(ref: ref);
    //       }
    //     }
    //
    //     if (from == 'BankPriceListAlert') {
    //       if (ref != null) {
    //         ref.read(bankInputProvider.notifier).setSelectedBankKey(key: '');
    //       }
    //     }
    //   });
    // }
  });
}
