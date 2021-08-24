import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('EH'),
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://dam.esquirelat.com/wp-content/uploads/2020/07/STANLEE.jpg'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://i1.wp.com/hipertextual.com/wp-content/uploads/2021/02/Iron-Man-PS5.jpg?fit=2500%2C1500&ssl=1'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
