///this file is where we run all package exports
///this is to reduce the repetition of import statements in our code
library;

export 'package:dio/dio.dart' hide Headers;
export 'package:firebase_core/firebase_core.dart';
export 'package:flutter/material.dart'
    hide
        MenuController,
        RefreshIndicator,
        RefreshIndicatorState,
        SearchController;
export 'package:flutter/services.dart';
export 'package:flutter_animate/flutter_animate.dart' hide Effect;
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:go_router/go_router.dart';
export 'package:signals/signals_flutter.dart';
export 'package:nexquub/l10n/generated/app_localizations.dart';
