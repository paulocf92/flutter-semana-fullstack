import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  final syncDate = ValueNotifier<DateTime?>(null);

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void save() {
    // TODO: Salvar os dados na base local
  }

  void init() {}
}
