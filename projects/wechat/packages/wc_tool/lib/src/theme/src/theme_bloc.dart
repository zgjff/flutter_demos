import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_preference_cache/app_preference_cache.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String themePresKey = 'theme_pres_key';

  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)) {
    on<InitThemeEvent>((event, emit) async {
      final pres = await AppPreferenceCache.getInstance();
      final value = pres.getInt(themePresKey);
      var themeMode = ThemeMode.system;
      if (value != null) {
        themeMode = (value == 1)
            ? ThemeMode.light
            : (value == 2)
                ? ThemeMode.dark
                : ThemeMode.system;
      }
      emit(ThemeState(themeMode: themeMode));
    });

    on<ChangeThemeEvent>((event, emit) async {
      if (event.themeMode == state.themeMode) {
        return;
      }
      final value = (event.themeMode == ThemeMode.light)
          ? 1
          : (event.themeMode == ThemeMode.dark)
              ? 2
              : 0;
      final _ = await AppPreferenceCache.getInstance()
        ..setInt(themePresKey, value);
      emit(ThemeState(themeMode: event.themeMode));
    });
  }
}
