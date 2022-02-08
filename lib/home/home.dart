import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "BMI Calculator",
              style: TextStyle(
                color: Colors.amberAccent,
                fontWeight: FontWeight.w300,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          backgroundColor: Colors.black26,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      child: TextField(
                        controller: _heightController,
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 130,
                      child: TextField(
                        controller: _weightController,
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "weight",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    setState(() {
                      _bmiResult = _w / (_h * _h);
                      if (_bmiResult > 25) {
                        _textResult = "You\'re Over Weight";
                      } else if (_bmiResult >= 18 && _bmiResult <= 25) {
                        _textResult = "You\'re Normal Weight";
                      } else {
                        _textResult = "You\'re Under Weight";
                      }
                    });
                  },
                  child: Container(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    _bmiResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 90,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
