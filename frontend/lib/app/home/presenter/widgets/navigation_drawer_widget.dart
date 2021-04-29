import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/app/home/presenter/widgets/navigation_actions_icon_widgets.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * (24 / 100);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: width * (3 / 100)),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/49077388?s=460&u=ec9520ac11646eea256440b5db57ede4af4bf6be&v=4')),
            color: Color(0xFFFFFFFF),
            shape: BoxShape.circle,
          ),
        ),
        title: Text(
          'Josimar',
          style: TextStyle(
            color: Color(0xFFFF9000),
            fontSize: width * (5 / 100),
          ),
        ),
        actions: [
          Row(
            children: [
              navigationActionsIconWidget(
                  width, Icon(Icons.message), 'Conversas não lidas',
                  positioned: true, color: Color(0xFFE53030), text: '+9'),
              navigationActionsIconWidget(
                  width, Icon(Icons.settings), 'Configurações',
                  positioned: false),
              navigationActionsIconWidget(
                  width, Icon(Icons.exit_to_app_outlined), 'Sair',
                  positioned: false),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height * (8 / 100),
            width: width,
            color: Color(0xFF312E38),
            padding: EdgeInsets.all(width * (3 / 100)),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar uma conversa...',
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
              color: Color(0xFF312E38).withOpacity(0.5),
              child: Text('Lista de contato'),
            ),
          )
        ],
      ),
    );
  }
}
