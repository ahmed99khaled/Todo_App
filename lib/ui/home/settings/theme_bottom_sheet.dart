import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/my_theme.dart';

import '../../../providers/settings_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeTHeme(ThemeMode.light);
              },
              child: provider.currentTheme == ThemeMode.light
                  ? getSelectedItem(AppLocalizations.of(context)!.light)
                  : getUnSelectedItem(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 18,
          ),
          InkWell(
              onTap: () {
                provider.changeTHeme(ThemeMode.dark);
              },
              child: provider.currentTheme == ThemeMode.light
                  ? getUnSelectedItem(AppLocalizations.of(context)!.dark)
                  : getSelectedItem(AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$title',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: MyTheme.lightPrimry)),
        Icon(
          Icons.check,
          color: MyTheme.lightPrimry,
          size: 32,
        ),
      ],
    );
  }

  Widget getUnSelectedItem(String title) {
    return Text('$title', style: Theme.of(context).textTheme.headline5);
  }
}
