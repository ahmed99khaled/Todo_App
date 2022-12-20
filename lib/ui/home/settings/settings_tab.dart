import 'package:flutter/material.dart';
import 'package:todo/ui/home/settings/theme_bottom_sheet.dart';
import 'package:todo/ui/my_theme.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Theme',
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
                'Light',
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
            'Language',
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
                'English',
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

  void showLanguageBottomSheet() {}
}
