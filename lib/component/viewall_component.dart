import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class ViewAllComponent extends StatelessWidget {
  final Function()? onPressed;
  const ViewAllComponent({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:  onPressed,
      child: Row(
        children: [
          Text(
            S.of(context).viewAll,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15),
          ),
          Icon(Icons.navigate_next_rounded,
              color: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
