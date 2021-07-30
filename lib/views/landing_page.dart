import 'package:flutter/material.dart';
import 'package:bank_deets/services/database.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameFieldController = TextEditingController()
    ..text = '';
  late TextEditingController _emailController = TextEditingController()
    ..text = '';
  late TextEditingController _phoneNumberController = TextEditingController()
    ..text = '';
  late TextEditingController _accountNumberFieldController =
      TextEditingController()..text = '';
  late TextEditingController _ifscCodeController = TextEditingController()
    ..text = '';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final nameField = TextFormField(
      controller: _nameFieldController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "John Doe",
        labelText: "Full Name",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "something@example.com",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final phoneNumber = TextFormField(
      controller: _phoneNumberController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "1234567890",
        labelText: "Phone number",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final accountNumberField = TextFormField(
      controller: _accountNumberFieldController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: "Account number",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final ifscCode = TextFormField(
      controller: _ifscCodeController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        labelText: "IFSC Code",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final fields = Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        nameField,
        emailField,
        phoneNumber,
        accountNumberField,
        ifscCode,
      ],
    );

    final submitButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: mq.size.width / 2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Submitted')),
          );
          await DatabseService().addData(
            _nameFieldController.text,
            _emailController.text,
            _phoneNumberController.text,
            _accountNumberFieldController.text,
            _ifscCodeController.text,
          );
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Toally not a scam'),
        backgroundColor: Color.fromRGBO(230, 57, 70, 0.9),
      ),
      backgroundColor: Color.fromRGBO(14, 65, 138, 0.8),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(36),
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    fields,
                    SizedBox(height: 30),
                    submitButton,
                  ]),
            ),
          )),
    );
  }
}
