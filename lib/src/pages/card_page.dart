import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardPage"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 15.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.deepPurple,
            ),
            title: Text("Somos los mejores"),
            subtitle: Text(
                "Si hay sol hay playa, si hay playa hay alcohol, si hay alcohol hay sexo, sie s contigo mejor"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/1853542/pexels-photo-1853542.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 350.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text("No idea"),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(2.0, 10.0),
          )
        ],
      ),
    );
  }
}
