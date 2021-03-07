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
      crossAxisAlignment: CrossAxisAlignment.start,
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
          padding: EdgeInsets.only(left: width * (3 / 100)),
          child: Row(
            children: [
              Text(
                'Flutter',
                style: TextStyle(
                  color: Color(0xFFFF9000),
                  fontSize: width * (2 / 100),
                ),
              ),
              SizedBox(width: 4),
              Text(
                'App',
                style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontSize: width * (2 / 100),
                ),
              ),
            ],
          ),
        ),
        Text('Ola mundo')
      ],
    );
  }
}
