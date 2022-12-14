import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.red,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .2,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (buildContext) {},
              backgroundColor: Colors.red,
              label: 'delete',
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topLeft: Radius.circular(18),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Play basket ball',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        Text('10:30 AM')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Theme.of(context).primaryColor,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 34,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
