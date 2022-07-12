import 'package:flutter/material.dart';

class DigimonPageButton extends StatelessWidget {
  const DigimonPageButton(
      {Key? key, this.onTap, required this.color, required this.icon})
      : super(key: key);

  final Function()? onTap;
  final Color color;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: color == Colors.white
                      ? Colors.black38.withOpacity(0.10)
                      : color.withOpacity(0.10),
                  blurRadius: 15,
                  offset: const Offset(0, 5))
            ]),
        child: icon,
      ),
    );
  }
}
