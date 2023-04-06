import 'package:flutter/material.dart';
import '../Converter.dart';

class unitPage extends StatefulWidget {
  const unitPage({Key? key}) : super(key: key);

  @override
  State<unitPage> createState() => _unitPageState();
}

class _unitPageState extends State<unitPage> {
  static const unit_List = [
    'นิ้ว to มิลลิเมตร',
    'มิลลิเมตร to นิ้ว',
    'ฟุต to เซนติเมตร',
    'เซนติเมตร to ฟุต',
    'ไมล์ to กิโลเมตร',
    'กิโลเมตร to ไมล์',
    'หลา to เมตร',
    'เมตร to หลา',
    'เมตร to ฟุต',
    'ฟุต to เมตร'
  ];
  var _feedbackText = '';
  final _controller = TextEditingController();

  void _handleClickButton(int i){
    var input = _controller.text;
    if (input == '') {
      setState(() {
        _feedbackText = 'Please enter the number.';
      });
      return;
    }
    var unit = double.tryParse(input);
    if(unit == null) {
      setState(() {
        _feedbackText = ' ERROR. Please try agian.';
      });
      return;
    }

    switch (i){
      case 0:
      //นิ้ว to มิลลิเมตร
        setState(() {
          _feedbackText = '$unit นิ้ว = ${Converter.ntomm(unit)} มิลลิเมตร';
        });
        break;

      case 1:
      //มิลลิเมตร to นิ้ว
        setState(() {
          _feedbackText = '$unit มิลลิเมตร = ${Converter.mmton(unit)} นิ้ว';
        });
        break;

      case 2:
      //ฟุต to เซนติเมตร
        setState(() {
          _feedbackText = '$unit ฟุต = ${Converter.ftocm(unit)} เซนติเมตร';
        });
        break;

      case 3:
      //เซนติเมตร to ฟุต
        setState(() {
          _feedbackText = '$unit เซนติเมตร = ${Converter.cmtof(unit)} ฟุต';
        });
        break;

      case 4:
      //ไมล์ to กิโลเมตร
        setState(() {
          _feedbackText = '$unit ไมล์ = ${Converter.miletokm(unit)} กิโลเมตร';
        });
        break;

      case 5:
      //กิโลเมตร to ไมล์
        setState(() {
          _feedbackText = '$unit กิโลเมตร = ${Converter.kmtomile(unit)} ไมล์';
        });
        break;

      case 6:
      //หลา to เมตร
        setState(() {
          _feedbackText = '$unit หลา = ${Converter.ydtom(unit)} เมตร';
        });
        break;

      case 7:
      //เมตร to หลา
        setState(() {
          _feedbackText = '$unit เมตร = ${Converter.mtoyd(unit)} หลา';
        });
        break;

      case 8:
      //เมตร to ฟุต
        setState(() {
          _feedbackText = '$unit เมตร = ${Converter.mtof(unit)} ฟุต';
        });
        break;

      case 9:
      //ฟุต to เมตร
        setState(() {
          _feedbackText = '$unit ฟุต = ${Converter.ftom(unit)} เมตร';
        });
        break;
    }
  }

  Widget _buildButton(int i){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _handleClickButton(i);
          },
          child: Text(unit_List[i]),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var myList = [
      ['นิ้ว to มิลลิเมตร', 'มิลลิเมตร to นิ้ว'],
      ['ฟุต to เซนติเมตร', 'เซนติเมตร to ฟุต'],
      ['ไมล์ to กิโลเมตร', 'กิโลเมตร to ไมล์'],
      ['หลา to เมตร', 'เมตร to หลา'],
      ['เมตร to ฟุต', 'ฟุต to เมตร'],
    ];

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/unit1.png'),
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.tealAccent.withOpacity(0.1),
                  border: Border.all(
                    width: 5.0,
                    color: Colors.blue.shade200,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(0),
                    _buildButton(1),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(2),
                    _buildButton(3),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(4),
                    _buildButton(5),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(6),
                    _buildButton(7),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _buildButton(8),
                    _buildButton(9),
                  ]),
                ],
              ),
            ),
            Text(
              _feedbackText,
              style: const TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}