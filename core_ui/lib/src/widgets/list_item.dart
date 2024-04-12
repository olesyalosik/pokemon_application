import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String name;
  const ListItem({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 10.0,
            )),
        child: Text(
          name,
          style: TextStyles.comfortaa_bold_12,
        ),
      ),
    );
  }
}
