import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whats_app_task/core/theme/colors.dart';

extension NumExtension on num {
  /// Gap
  SizedBox get gap {
    return SizedBox(height: toDouble(), width: toDouble());
  }

  /// Edge Insets
  EdgeInsets get edgeInsetsAll {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get edgeInsetsVertical {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  EdgeInsets get edgeInsetsHorizontal {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  /// Border Radius
  BorderRadius get borderRadiusAll {
    return BorderRadius.circular(toDouble());
  }

  /// Duration
  Duration get hour {
    return Duration(hours: toInt());
  }

  Duration get min {
    return Duration(minutes: toInt());
  }

  Duration get sec {
    return Duration(seconds: toInt());
  }

  Duration get milSec {
    return Duration(milliseconds: toInt());
  }

  Duration get micSec {
    return Duration(microseconds: toInt());
  }
}

extension StringsExtension on String {
  Future<bool?> get showToast {
    return Fluttertoast.showToast(msg: this, textColor: AppColors.toastText, backgroundColor: AppColors.toastBackground);
  }
}
