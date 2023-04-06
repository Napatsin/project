import 'package:flutter/material.dart';
import 'package:project/page/home_page.dart';

class LoginPage extends StatefulWidget {

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _inputPIN = '';
  static const _PIN = '123456';
  double buttonSize = 75.0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_open_sharp,
                        size: 75.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Text('LOGIN', style: TextStyle(color: Colors.black, fontSize: 40.0),),
                  Text('Enter PIN to Login', style: TextStyle(fontSize: 25.0, color: Colors.black),),
                  Text('Password 123456', style: TextStyle(fontSize: 20.0, color: Colors.black12),),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(var i = 0; i < 6; i++) buildPassCode(i: i),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 1; i <=3 ; i++) _buildButton2(num: i),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 4; i <= 6; i++) _buildButton2(num: i),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 7; i <= 9; i++) _buildButton2(num: i),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 75.0,
                            height: 75.0,
                          ),
                        ),
                        _buildButton2(num: 0),
                        _buildButton2(num: -1),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'ลืมรหัสผ่าน',
                          style: TextStyle(fontSize: 30.0, color: Colors.indigo),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildButton2({int? num}) {
    Widget? child;
    BoxDecoration? boxDecoration;
    if(num != -1) {
      child = Text('${num}', style: TextStyle(fontSize: 20.0, color: Colors.black),);
      boxDecoration = BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.cyan, width: 2.0),
        borderRadius: BorderRadius.circular(16.0),
      );
    } else {
      child = Icon(Icons.backspace, size: 30.0,color: Colors.black,);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (num != -1 && _inputPIN.length != 6) {
              _inputPIN += '$num';
            }
            else
              _inputPIN = _inputPIN.substring(0, _inputPIN.length - 1);
          });
          checkPin();
        },
        borderRadius: BorderRadius.circular(buttonSize/2),
        child: Container(
          width: buttonSize,
          height: buttonSize,
          decoration: boxDecoration,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
  checkPin() {
    if(_inputPIN.length == 6) {
      if(_inputPIN == _PIN) {
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            _inputPIN = '';
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()
            ),
          );
        });
      }
      else {
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            _inputPIN = '';
          });
          showDialog(context: context, barrierDismissible: false, builder: (BuildContext context, ) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Text('Incorrect PIN'),
                ],
              ),
              content: Text('Please try again'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok', style: TextStyle(color: Colors.black),)
                ),
              ],
            );
          });
        });
      }
    }
  }

  Widget buildPassCode({int? i}) {
    BoxDecoration? blankPIN = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.brown.withOpacity(0.25),
    );

    BoxDecoration? fillPIN = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.lightBlue,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0, left: 10.0, right: 10.0),
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: (i! < _inputPIN.length)? fillPIN : blankPIN,
      ),
    );
  }
}