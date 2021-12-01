import 'package:flutter/material.dart';
import 'package:flutter_modules/constants/color_configs.dart';
import 'package:flutter_modules/constants/text_configs.dart';
import 'package:flutter_modules/flutter_modules.dart';

class CustomizeLoginScreen {
  final Color primaryColor;
  final Color backgroundColor;
  final String? subtitle;
  final TextStyle subtitleStyle;
  final Widget? logo;
  final TextStyle? textFieldStyle;
  final InputDecoration? textFieldDecoration;
  final Map<ButtonStatus, Widget>? stateWidgets;
  final Map<ButtonStatus, Color>? stateColors;

  CustomizeLoginScreen({
    this.primaryColor = ColorConfigs.kColorPrimary,
    this.backgroundColor = ColorConfigs.kColorLight,
    this.subtitle,
    this.logo,
    this.subtitleStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: ColorConfigs.kColorDark,
    ),
    this.textFieldStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: ColorConfigs.kColorDark,
    ),
    this.textFieldDecoration,
    this.stateWidgets = const {
      ButtonStatus.idle: Text(
        "LOG IN",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: ColorConfigs.kColorLight,
        ),
      ),
      ButtonStatus.fail: Text(
        "Có lỗi xảy ra",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: ColorConfigs.kColorLight,
        ),
      ),
      ButtonStatus.success: Text(
        "LOG IN",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: ColorConfigs.kColorLight,
        ),
      ),
    },
    this.stateColors = const {
      ButtonStatus.idle: ColorConfigs.kColorPrimary,
      ButtonStatus.loading: ColorConfigs.kColorPrimary,
      ButtonStatus.fail: ColorConfigs.kColorError,
      ButtonStatus.success: ColorConfigs.kColorPrimary,
    },
  });
}

class CustomizeWidgetRemember {
  final String? title;
  final TextStyle? styleTitle;
  final Widget? iconEnable;
  final Widget? iconDisable;
  final ValueChanged<bool>? rememberMeChanged;

  CustomizeWidgetRemember(
      {this.title,
      this.styleTitle,
      this.iconEnable,
      this.iconDisable,
      this.rememberMeChanged});
}

class CustomizeWidgetForgotPassword {
  final String? title;
  final TextStyle? styleTitle;
  final Widget? icon;

  final Future<bool?> Function()? onForgotPasswordClicked;

  CustomizeWidgetForgotPassword(
      {this.title, this.styleTitle, this.icon, this.onForgotPasswordClicked});
}
