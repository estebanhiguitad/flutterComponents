import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String? _selectedOption;
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entradas de texto')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Tu nombre es: $_name'),
      subtitle: Text('Correo de contacto: $_email'),
    );
  }

  Widget _createInput() {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nombre tuyo',
        suffixIcon: Icon(Icons.verified_user),
        icon: Icon(Icons.contact_phone),
        labelText: 'El label de apoyo',
        counter: Text('Letras ${_name.length}'),
        helperText: 'Escriba su nombre completo',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          /* borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.none,
          ) */
        ),
      ),
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Correo tuyo',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        labelText: 'El label de apoyo',
        counter: Text('Letras ${_email.length}'),
        helperText: 'Escriba su correo completo',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          /* borderSide: BorderSide(
            width: 1.0,
            style: BorderStyle.none,
          ) */
        ),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Contraseña tuya',
        icon: Icon(Icons.password),
        suffixIcon: Icon(Icons.remove_red_eye),
        labelText: 'El label de apoyo',
        counter: Text('Letras ${_password.length}'),
        helperText: 'Escriba su contraseña completo',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createDate() {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento tuya',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.calendar_view_day_outlined),
        labelText: 'Fecha de nacimiento',
        counter: Text('Letras ${_password.length}'),
        helperText: 'Escriba su fecha de nacimiento completo',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate();
      },
    );
  }

  _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2030),
      locale: Locale('es'),
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(
      children: [
        Icon(Icons.power),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            value: _selectedOption,
            items: _getDropdownOptions(),
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropdownOptions() {
    List<DropdownMenuItem<String>> items = [];
    items.add(DropdownMenuItem(
      child: Text('Volar'),
      value: 'volar',
    ));
    items.add(DropdownMenuItem(
      child: Text('Rayos X'),
      value: 'raoys_x',
    ));
    items.add(DropdownMenuItem(
      child: Text('Fuerza'),
      value: 'fuerza',
    ));
    return items;
  }
}
