import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget navigationActionsIconWidget(double width, Icon icon, String tooltip,
    {bool positioned, Color color, String text}) {
  return Stack(
    fit: StackFit.loose,
    clipBehavior: Clip.hardEdge,
    children: [
      IconButton(
        color: Color(0xFFFFFFFF),
        iconSize: width * (7 / 100),
        padding: EdgeInsets.all(width * (2 / 100)),
        icon: icon,
        tooltip: tooltip,
        onPressed: () {},
      ),
      positioned ??
          Positioned(
            top: 2,
            right: 1,
            child: Container(
              width: width * (5 / 100),
              height: width * (5 / 100),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: width * (3 / 100),
                  ),
                ),
              ),
            ),
          )
    ],
  );
}
