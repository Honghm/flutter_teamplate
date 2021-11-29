import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_configs.dart';


class TextConfigs {
  static final kTextConfig = TextStyle(
    fontSize: ScreenUtil().setSp(40),
    fontWeight: FontWeight.normal,
    color: ColorConfigs.kColorLight,
  );
  static final kText80Bold_Dark = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(80),
    fontWeight: FontWeight.w700,
    color: ColorConfigs.kColorDark,
  );
  static final kText30Normal_Hint = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(30),
    color: ColorConfigs.kColorHint,
  );
  static final kText35Normal_Hint = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(35),
    color: ColorConfigs.kColorHint,
  );
  static final kText40Normal_Dark = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(40),
    color: ColorConfigs.kColorDark,
  );
  static final kText40Normal_Primary = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(40),
    color: ColorConfigs.kColorPrimary,
  );
  static final kText40Normal_Error = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(40),
    color: ColorConfigs.kColorError,
  );
  static final kText40Normal_Hint = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(40),
    color: ColorConfigs.kColorHint,
  );
  static final kText45Bold_Hint = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(45),
    fontWeight: FontWeight.bold,
    color: ColorConfigs.kColorHint,
  );
  static final kText72Bold_Dark = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(72),
    color: ColorConfigs.kColorDark,
    fontWeight: FontWeight.bold,
  );
  static final kText60Bold_Primary = kTextConfig.copyWith(
    fontSize: ScreenUtil().setSp(60),
    fontWeight: FontWeight.bold,
    color: ColorConfigs.kColorPrimary,
  );
}
