import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AvatarPage"),
        actions: [
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.2HgWxlt6o5NKSicmnfV6rwHaHa?pid=Api&rs=1'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.amber,
            ),
          ),
        ],
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/c/c2/Ethic_Dong_Liping_Guizhou_China.jpg'),
        ),
      ),
    );
  }
}
