import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static final InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        errorMaxLines: 3,
        prefixIconColor: TColors.darkGrey,
        suffixIconColor: TColors.darkGrey,
        labelStyle: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeMd,
          color: TColors.black,
        ),
        hintStyle: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeSm,
          color: TColors.black,
        ),
        errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
        floatingLabelStyle: const TextStyle().copyWith(
          color: const Color.fromRGBO(35, 35, 35, 0.8),
        ),
        border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.grey),
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.grey),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.dark),
        ),
        errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.warning),
        ),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 2, color: TColors.warning),
        ),
      );

  static final InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
        errorMaxLines: 2,
        prefixIconColor: TColors.darkGrey,
        suffixIconColor: TColors.darkGrey,
        labelStyle: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeMd,
          color: TColors.white,
        ),
        hintStyle: const TextStyle().copyWith(
          fontSize: TSizes.fontSizeSm,
          color: TColors.white,
        ),
        floatingLabelStyle: const TextStyle().copyWith(
          color: const Color.fromRGBO(255, 255, 255, 0.8),
        ),
        border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.white),
        ),
        errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 1, color: TColors.warning),
        ),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: const BorderSide(width: 2, color: TColors.warning),
        ),
      );
}
