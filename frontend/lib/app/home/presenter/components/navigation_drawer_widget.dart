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
                  Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Container(
                        height: height * (7 / 100),
                        width: height * (7 / 100),
                        margin: EdgeInsets.only(left: width * (3 / 100)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://avatars.githubusercontent.com/u/49077388?s=460&u=ec9520ac11646eea256440b5db57ede4af4bf6be&v=4')),
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: width * (5 / 100),
                          height: width * (5 / 100),
                          decoration: BoxDecoration(
                            color: Color(0xFF04d361),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * (3 / 100)),
                    child: Text(
                      'Josimar',
                      style: TextStyle(
                        color: Color(0xFFFF9000),
                        fontSize: width * (5 / 100),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      IconButton(
                        color: Color(0xFFFFFFFF),
                        iconSize: width * (7 / 100),
                        padding: EdgeInsets.all(width * (2 / 100)),
                        icon: Icon(Icons.notifications),
                        tooltip: 'Notificações',
                        onPressed: () {},
                      ),
                      Positioned(
                        top: 2,
                        right: 1,
                        child: Container(
                          width: width * (5 / 100),
                          height: width * (5 / 100),
                          decoration: BoxDecoration(
                            color: Color(0xFFE53030),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '+9',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: width * (3 / 100),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    fit: StackFit.loose,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      IconButton(
                        color: Color(0xFFFFFFFF),
                        iconSize: width * (7 / 100),
                        padding: EdgeInsets.all(width * (2 / 100)),
                        icon: Icon(Icons.settings),
                        tooltip: 'Configurações',
                        onPressed: () {},
                      ),
                      Positioned(
                        top: 2,
                        right: 1,
                        child: Container(
                          width: width * (5 / 100),
                          height: width * (5 / 100),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF9000),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
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
        ),
        Container(
          height: height * (8 / 100),
          width: width,
          color: Color(0xFF312E38).withOpacity(0.5),
          padding: EdgeInsets.all(width * (3 / 100)),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Digite para buscar no menu...',
              hintStyle: TextStyle(
                  color: Color(0xFFCCCCCC).withOpacity(0.8),
                  fontSize: width * (4 / 100)),
              prefixIcon: Icon(Icons.search),
              prefixStyle: TextStyle(color: Color(0xFFCCCCCC)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: width,
            height: height - (18 / 100),
            color: Color(0xFF312E38),
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFF9000).withOpacity(0.7),
                        Color(0xFFF9A437).withOpacity(0.7),
                      ],
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text('Dashboard'),
                    onTap: () {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
