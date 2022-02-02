import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  String weight = "";
  String height = "";
  double bmiIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                      ),
                      labelText: "Weight in Kgs"),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (w) {
                    setState(() {
                      weight = w;
                    });
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.height,
                    ),
                    labelText: "Height in cms",
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (h) {
                    setState(() {
                      height = h;
                    });
                  },
                ),
                SizedBox(height: 80),
                weight != "" && height != ""
                    ? Text(
                        "Your BMI: " + calculateBmi(weight, height),
                        style: TextStyle(fontSize: 20),
                      )
                    : Text(""),
              ],
            )),
      ),
    );
  }

  String calculateBmi(String weight, String height) {
    double w = double.parse(weight);
    double h = double.parse(height);
    if (h == 0) return "";

    double bmi = w * 10000 / (h * h);
    bmiIndex = bmi;
    return bmi.toStringAsFixed(2);
  }
}
