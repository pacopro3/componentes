import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _pwd = '';
  String _fecha = '';
  String _opcselect = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        children: [
          _crearInput(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPwd(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        icon: Icon(Icons.accessibility_new),
        suffixIcon: Icon(Icons.blur_on),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Longitud correo ${_email.length}'),
        hintText: 'Correo de la persona',
        labelText: 'Correo',
        helperText: 'Solo el correo sin espacios',
        icon: Icon(Icons.alternate_email),
        suffixIcon: Icon(Icons.blur_on),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPwd() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Longitud pwd ${_pwd.length}'),
        hintText: 'PWD de la persona',
        labelText: 'password',
        helperText: 'Solo la contraseña sin espacios',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.blur_on),
      ),
      onChanged: (value) {
        setState(() {
          _pwd = value;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDate,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        counter: Text('Fecha de nacimiento ${_fecha.length}'),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        helperText: 'Fecha de nacimiento de la persona',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.blur_on),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDate.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return DropdownButton(
      value: _opcselect,
      items: getOpcionesDropdown(),
      onChanged: (value) {
        setState(() {
          _opcselect = value;
        });
      },
    );
  }
}
