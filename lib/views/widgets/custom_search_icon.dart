import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.iconData, this.onPressed});

  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              size: 30,
              color: Colors.white,
            )),
      ),
    );
  }
}
