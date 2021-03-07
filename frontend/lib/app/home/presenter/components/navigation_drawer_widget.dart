import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * (24 / 100);
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: height * (10 / 100),
          width: width,
          color: Color(0xFF312E38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: height * (7 / 100),
                    width: height * (7 / 100),
                    margin: EdgeInsets.only(left: width * (3 / 100)),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * (3 / 100)),
                    child: Text(
                      'Josimar',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: width * (4 / 100),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      color: Color(0xFFFFFFFF),
                      iconSize: width * (7 / 100),
                      padding: EdgeInsets.all(width * (2 / 100)),
                      icon: Icon(Icons.notifications),
                      tooltip: 'Notificações',
                      onPressed: () {}),
                  IconButton(
                      color: Color(0xFFFFFFFF),
                      iconSize: width * (7 / 100),
                      padding: EdgeInsets.all(width * (2 / 100)),
                      icon: Icon(Icons.settings),
                      tooltip: 'Configurações',
                      onPressed: () {}),
                  IconButton(
                      color: Color(0xFFFFFFFF),
                      iconSize: width * (7 / 100),
                      padding: EdgeInsets.all(width * (2 / 100)),
                      icon: Icon(Icons.exit_to_app_outlined),
                      tooltip: 'Sair',
                      onPressed: () {}),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
