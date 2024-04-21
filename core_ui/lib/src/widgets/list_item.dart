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
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: AppColors.primaryColor,
          //   width: 3.0,
          // ),
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(name,
              style: TextStyles.comfortaa_light_24.copyWith(
                color: AppColors.textColor,
              )),
        ),
      ),
    );
  }
}
