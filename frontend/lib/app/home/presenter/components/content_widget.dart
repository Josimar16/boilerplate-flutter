import 'package:flutter/widgets.dart';

class ContentWidget extends StatefulWidget {
  @override
  _ContentWidgetState createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * (59.9 / 100);
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          child: Container(
            color: Color(0xFFCCCCCC),
          ),
        ),
        Container(
          height: height * (10 / 100),
          width: width,
          color: Color(0xFF312E38),
        ),
      ],
    );
  }
}
