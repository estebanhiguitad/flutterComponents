import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    List<Widget> list = [];
    data.forEach((element) {
      final temporalWidget = new ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blueAccent,
        ),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
          /* 
          Esta es la forma tradicional de hacer la navegación.

          final route = MaterialPageRoute(
            builder: (context) => AlertPage(),
          );
          Navigator.push(context, route); */
        },
      );
      list..add(temporalWidget)..add(Divider());
    });
    return list;
  }
}
