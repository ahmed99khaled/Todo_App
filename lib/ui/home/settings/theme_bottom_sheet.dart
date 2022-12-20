import 'package:flutter/material.dart';
import 'package:todo/ui/my_theme.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSelectedItem('Light'),
          SizedBox(
            height: 18,
          ),
          getUnSelectedItem('Dark'),
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
