import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

class ThemesManager {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.lightModeBackground,
    colorScheme: ColorScheme.light(primary: ColorsManager.main),
    primaryColor: ColorsManager.lightModePrimary,
    cardColor: ColorsManager.main,
    cardTheme: CardTheme(
        color: ColorsManager.white,
        shadowColor: ColorsManager.shadowColor,
        elevation: SizeManager.s4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeManager.s10),
          topRight: Radius.circular(SizeManager.s10),
          bottomRight: Radius.circular(SizeManager.s10),
          bottomLeft: Radius.circular(SizeManager.s10),
        ))),
    appBarTheme: AppBarTheme(
      shadowColor: ColorsManager.shadowColor,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorsManager.white),
      centerTitle: true,
      elevation: SizeManager.s0,
      iconTheme: IconThemeData(color: ColorsManager.main),
      backgroundColor: ColorsManager.lightModeBackground,
    ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: ColorsManager.lightModeDarkGrey, fontSize: FontSize.s16),
      headlineLarge: getBoldStyle(
          color: ColorsManager.lightModeText, fontSize: FontSize.s24),
      headlineSmall: getRegularStyle(
          color: ColorsManager.lightModeText, fontSize: FontSize.s14),
      labelLarge: getBoldStyle(
          color: ColorsManager.lightModeText, fontSize: FontSize.s24),
      labelMedium: getSemiBoldStyle(
          color: ColorsManager.lightModeText, fontSize: FontSize.s18),
      labelSmall: getRegularStyle(
          color: ColorsManager.lightModeDarkGrey, fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(
          color: ColorsManager.lightModeText, fontSize: FontSize.s24),
      bodyMedium: getRegularStyle(
          color: ColorsManager.lightModeGrey, fontSize: FontSize.s14),
      bodySmall: getRegularStyle(color: ColorsManager.lightModeGrey1),
      headlineMedium: getSemiBoldStyle(
          color: ColorsManager.lightModeGrey1, fontSize: FontSize.s18),
      titleMedium:
          getMediumStyle(color: ColorsManager.main, fontSize: FontSize.s16),
      titleSmall: getRegularStyle(color: ColorsManager.main),
    ),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(PaddingManager.p8),
        hintStyle: getRegularStyle(
            color: ColorsManager.lightModeGrey, fontSize: FontSize.s14),
        labelStyle: getMediumStyle(
            color: ColorsManager.lightModeGrey, fontSize: FontSize.s14),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4)),
            borderSide: BorderSide(
                color: ColorsManager.lightModeGrey, width: SizeManager.s0_5)),
        errorStyle: getRegularStyle(color: ColorsManager.error),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.lightModeGrey, width: SizeManager.s0_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.error, width: SizeManager.s0_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.main, width: SizeManager.s0_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4)))),
    iconTheme: IconThemeData(color: ColorsManager.main),
    disabledColor: ColorsManager.disabledPrimary,
    splashColor: ColorsManager.splashColor,
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorsManager.disabledPrimary,
        buttonColor: ColorsManager.main,
        splashColor: ColorsManager.splashColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.white, fontSize: FontSize.s16),
            backgroundColor: ColorsManager.main,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManager.s4)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.main, fontSize: FontSize.s16),
            backgroundColor: ColorsManager.lightModeBackground,
            foregroundColor: ColorsManager.disabledPrimary,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorsManager.main),
                borderRadius: BorderRadius.circular(SizeManager.s4)))),
    navigationBarTheme: NavigationBarThemeData(
        indicatorColor: ColorsManager.navigationBarBackground,
        backgroundColor: ColorsManager.disabledPrimary),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkModeBackground,
    colorScheme: ColorScheme.dark(primary: ColorsManager.white),
    primaryColor: ColorsManager.darkModePrimary,
    cardColor: ColorsManager.black,
    cardTheme: CardTheme(
        color: ColorsManager.black,
        shadowColor: ColorsManager.shadowColor,
        elevation: SizeManager.s4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeManager.s10),
          topRight: Radius.circular(SizeManager.s10),
          bottomRight: Radius.circular(SizeManager.s10),
          bottomLeft: Radius.circular(SizeManager.s10),
        ))),
    appBarTheme: AppBarTheme(
      shadowColor: ColorsManager.shadowColor,
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorsManager.white),
      centerTitle: true,
      elevation: SizeManager.s0,
      iconTheme: IconThemeData(color: ColorsManager.main),
      backgroundColor: ColorsManager.darkModeBackground,
    ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(
          color: ColorsManager.darkModeDarkGrey, fontSize: FontSize.s16),
      headlineLarge: getBoldStyle(
          color: ColorsManager.darkModeText, fontSize: FontSize.s24),
      headlineSmall: getRegularStyle(
          color: ColorsManager.darkModeText, fontSize: FontSize.s14),
      labelLarge: getBoldStyle(
          color: ColorsManager.darkModeText, fontSize: FontSize.s24),
      labelMedium: getSemiBoldStyle(
          color: ColorsManager.darkModeText, fontSize: FontSize.s18),
      labelSmall: getRegularStyle(
          color: ColorsManager.darkModeDarkGrey, fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(
          color: ColorsManager.darkModeText, fontSize: FontSize.s24),
      bodyMedium: getRegularStyle(
          color: ColorsManager.darkModeGrey, fontSize: FontSize.s14),
      bodySmall: getRegularStyle(color: ColorsManager.darkModeGrey1),
      headlineMedium: getSemiBoldStyle(
          color: ColorsManager.darkModeGrey1, fontSize: FontSize.s18),
      titleMedium:
          getMediumStyle(color: ColorsManager.main, fontSize: FontSize.s16),
      titleSmall: getRegularStyle(color: ColorsManager.main),
    ),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(PaddingManager.p8),
        hintStyle: getRegularStyle(
            color: ColorsManager.darkModeGrey, fontSize: FontSize.s14),
        labelStyle: getMediumStyle(
            color: ColorsManager.darkModeGrey, fontSize: FontSize.s14),
        enabledBorder: OutlineInputBorder(
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4)),
            borderSide: BorderSide(
                color: ColorsManager.darkModeGrey, width: SizeManager.s0_5)),
        errorStyle: getRegularStyle(color: ColorsManager.error),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.darkModeGrey, width: SizeManager.s0_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.error, width: SizeManager.s0_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.main, width: SizeManager.s0_5),
            borderRadius:
                const BorderRadius.all(Radius.circular(SizeManager.s4)))),
    iconTheme: IconThemeData(color: ColorsManager.main),
    disabledColor: ColorsManager.disabledPrimary,
    splashColor: ColorsManager.splashColor,
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorsManager.disabledPrimary,
        buttonColor: ColorsManager.main,
        splashColor: ColorsManager.splashColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.white, fontSize: FontSize.s16),
            backgroundColor: ColorsManager.main,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeManager.s4)))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.main, fontSize: FontSize.s16),
            backgroundColor: ColorsManager.darkModeBackground,
            foregroundColor: ColorsManager.disabledPrimary,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorsManager.main),
                borderRadius: BorderRadius.circular(SizeManager.s4)))),
    navigationBarTheme: NavigationBarThemeData(
        indicatorColor: ColorsManager.navigationBarBackground,
        backgroundColor: ColorsManager.disabledPrimary),
  );
}
