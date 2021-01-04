import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 1.0;
  bool _bloquearcheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.blue,
      label: 'Tamaño Imagen',
      divisions: 50,
      value: _valueSlider,
      min: 0,
      max: 500,
      onChanged: (_bloquearcheck)
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _bloquearcheck,
      onChanged: (value) {
        setState(() {
          _bloquearcheck = value;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _bloquearcheck,
      onChanged: (value) {
        setState(() {
          _bloquearcheck = value;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://images.pexels.com/photos/3943553/pexels-photo-3943553.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
}
