import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/home/settings/language_bottom_sheet.dart';
import 'package:todo/ui/home/settings/theme_bottom_sheet.dart';
import 'package:todo/ui/my_theme.dart';

import '../../../providers/settings_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style:
                Theme.of(context).textTheme.headline5?.copyWith(fontSize: 18),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 1.6, color: Theme.of(context).primaryColor),
              ),
              child: Text(
                provider.currentTheme == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: MyTheme.lightPrimry, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style:
                Theme.of(context).textTheme.headline5?.copyWith(fontSize: 18),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 1.6, color: Theme.of(context).primaryColor),
              ),
              child: Text(
                provider.language == 'en'
                    ? AppLocalizations.of(context)!.english
                    : AppLocalizations.of(context)!.arabic,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: MyTheme.lightPrimry, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }
}
