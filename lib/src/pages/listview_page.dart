import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _numbersList = [];
  int _numberInList = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getNumbers();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: [
            _createList(),
            _createLoading(),
          ],
        ));
  }

  Future<void> fetchPageOne() async {
    final dateInit = DateTime.now().millisecondsSinceEpoch;
    print(dateInit);
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numbersList.clear();
      _numberInList++;
      _getNumbers();
      print(DateTime.now().millisecondsSinceEpoch - dateInit);
    });
    return Future.delayed(duration);
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: fetchPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (context, position) {
          final image = _numbersList[position];
          return Column(
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image:
                    NetworkImage('https://picsum.photos/500/300?image=$image'),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          );
        },
      ),
    );
  }

  void _getNumbers() {
    for (var index = 0; index < 10; index++) {
      _numberInList++;
      _numbersList.add(_numberInList);
    }
    setState(() {});
  }

  Future<Timer> _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    final _duration = new Duration(seconds: 2);
    return new Timer(_duration, onResponse);
  }

  void onResponse() {
    setState(() {
      _isLoading = false;
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250),
      );
    });
    _getNumbers();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
