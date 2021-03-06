import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/app/search/domain/entities/result.dart';

class ProfilePage extends StatefulWidget {
  final Result result;

  const ProfilePage({
    Key key,
    this.result,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.result.image),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Text(
            widget.result.nickname,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 62.9,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
