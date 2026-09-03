import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_guiritter/common/_import.dart'
    show AppLocalizationsGuiRitter;
import 'package:flutter_guiritter/common/_import.dart' as common_gui_ritter;
import 'package:flutter_guiritter/model/_import.dart' as model_gui_ritter;
import 'package:flutter_guiritter/model/_import.dart' show LoadingTagModel;
import 'package:string_analyzer/common/_import.dart' show AppLocalizations;

class StateModelWrapper
    extends model_gui_ritter.StateModelWrapper<AppLocalizations> {
  StateModelWrapper({
    required super.storeStateMap,
  });

  factory StateModelWrapper.deserialize({
    required String serialized,
  }) {
    final json = jsonDecode(
      serialized,
    );

    final storeStateMap = {
      common_gui_ritter.StateKey.l10n: null,
      common_gui_ritter.StateKey.l10nGuiRitter: null,
      common_gui_ritter.StateKey.themeMode: ThemeMode.values.byName(
        json[common_gui_ritter.StateKey.themeMode],
      ),
      common_gui_ritter.StateKey.loadingTagList: <LoadingTagModel>[],
      common_gui_ritter.StateKey.token: json[common_gui_ritter.StateKey.token],
    };

    return StateModelWrapper(
      storeStateMap: storeStateMap,
    );
  }

  StateModelWrapper.init({
    required AppLocalizations? l10n,
    required AppLocalizationsGuiRitter? l10nGuiRitter,
    required List<LoadingTagModel> loadingTagList,
    required String? token,
    required ThemeMode themeMode,
  }) : this(
          storeStateMap: {
            common_gui_ritter.StateKey.l10n: l10n,
            common_gui_ritter.StateKey.l10nGuiRitter: l10nGuiRitter,
            common_gui_ritter.StateKey.loadingTagList: loadingTagList,
            common_gui_ritter.StateKey.themeMode: themeMode,
            common_gui_ritter.StateKey.token: token,
          },
        );
}
