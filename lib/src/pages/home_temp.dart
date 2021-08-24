import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    final String environment = FlavorConfig.instance?.variables != null
        ? FlavorConfig.instance?.variables!['environment']
        : '';
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Componentes temp $environment')),
        body: ListView(
          children: _buildListViewItemsShort(),
        ),
      ),
    );
  }

  /* List<Widget> _buildListViewItems() {
    List<Widget> itemsList = [];
    for (var item in options) {
      final tempWidget = new ListTile(
        title: Text(item),
      );
      itemsList..add(tempWidget)..add(new Divider());
    }
    return itemsList;
  } */

  List<Widget> _buildListViewItemsShort() {
    return options
        .map((item) => Column(
              children: [
                ListTile(
                  title: Text(item),
                  subtitle: Text('Este es el subtítulo'),
                  leading: Icon(Icons.access_alarm_sharp),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
