import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/app/home/presenter/widgets/content_widget.dart';
import 'package:frontend/app/home/presenter/widgets/navigation_drawer_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthContainer = width * (84 / 100);

    return Scaffold(
      body: Container(
        color: Color(0xFF323238),
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: [
            Container(
              color: Color(0xFF28262E),
              constraints: BoxConstraints(
                maxWidth: width,
                minWidth: width,
                maxHeight: (height / 100) * 25,
                minHeight: (height / 100) * 25,
              ),
            ),
            Positioned(
              bottom: (height / 100) * 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF3E3B47),
                ),
                constraints: BoxConstraints(
                  maxWidth: widthContainer,
                  minWidth: widthContainer,
                  maxHeight: (height / 100) * 90,
                  minHeight: (height / 100) * 90,
                ),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (24 / 100),
                      child: NavigationDrawerWidget(),
                    ),
                    Positioned(
                      right: 0,
                      child: ContentWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
