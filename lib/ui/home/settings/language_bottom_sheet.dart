import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/my_theme.dart';

import '../../../providers/settings_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
                provider.changeLanguage('en');
              },
              child: provider.language == 'en'
                  ? getSelectedItem(AppLocalizations.of(context)!.english)
                  : getUnSelectedItem(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 18,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.language == 'en'
                  ? getUnSelectedItem(AppLocalizations.of(context)!.arabic)
                  : getSelectedItem(AppLocalizations.of(context)!.arabic)),
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
