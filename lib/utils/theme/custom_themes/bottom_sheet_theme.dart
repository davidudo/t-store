import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static final BottomSheetThemeData lightBottomSheetTheme =
      BottomSheetThemeData(
        showDragHandle: true,
        backgroundColor: TColors.white,
        modalBackgroundColor: TColors.white,
        constraints: const BoxConstraints(minWidth: double.infinity),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );

  static final BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: TColors.black,
    modalBackgroundColor: TColors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
