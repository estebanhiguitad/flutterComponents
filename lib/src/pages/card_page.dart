import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          cardListTypeOne(),
          SizedBox(height: 20.0),
          cardlistTypeTwo(),
          SizedBox(height: 20.0),
          cardListTypeOne(),
          SizedBox(height: 20.0),
          cardlistTypeTwo(),
          SizedBox(height: 20.0),
          cardListTypeOne(),
          SizedBox(height: 20.0),
          cardlistTypeTwo(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget cardListTypeOne() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blueAccent,
            ),
            title: Text('Soy el título de la tarjeta'),
            subtitle: Text(
                'Esta e suna super descripción de algo que neceistamos para poder mostrar un texto que sea muy largo para nosotros'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Aceptar'))
            ],
          )
        ],
      ),
    );
  }

  Widget cardlistTypeTwo() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'http://elcl6.coe.int/slider/Vue%20imprenable%20sur%20les%20lacs%20de%20montagne%20des%20Alpes%20albanaises%20-%20shutterstock_154266695(2).jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 15),
            height: 270.0,
            fit: BoxFit.cover,
          ),
          /* Image(

            image: NetworkImage(
                'http://elcl6.coe.int/slider/Vue%20imprenable%20sur%20les%20lacs%20de%20montagne%20des%20Alpes%20albanaises%20-%20shutterstock_154266695(2).jpg'),
          ), */
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('paisaje hermoso de europa'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2.0, 10.0),
              spreadRadius: 2.0,
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
