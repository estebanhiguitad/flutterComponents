import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _blokedCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            _createImage(),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _sliderValue,
      min: 0.0,
      max: 400.0,
      onChanged: (_blokedCheck)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _blokedCheck,
      onChanged: (value) {
        setState(() {
          if (value != null) _blokedCheck = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _blokedCheck,
      onChanged: (value) {
        setState(() {
          _blokedCheck = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Expanded(
      child: Image(
        image: NetworkImage(
          'https://e00-ar-marca.uecdn.es/claro/assets/multimedia/imagenes/2021/07/05/16254880727548.jpg',
        ),
        width: _sliderValue,
        fit: BoxFit.contain,
      ),
    );
  }
}
