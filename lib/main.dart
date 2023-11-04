import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BMICalculator(),
    ));

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double weight = 0;
  double height = 0;
  double bmi = 0;
  String result = "";

  void calculateBMI() {
    try {
      if (weight > 0 && height > 0) {
        double heightInMeters = height / 100;
        bmi = weight / (heightInMeters * heightInMeters);

        setState(() {
          result = "BMI: ${bmi.toStringAsFixed(2)}";

          if (bmi < 18.5) {
            result += " (Underweight)";
          } else if (bmi < 24.9) {
            result += " (Normal Weight)";
          } else if (bmi < 29.9) {
            result += " (Overweight)";
          } else {
            result += " (Obese)";
          }
        });
      } else {
        setState(() {
          result = "Invalid Input";
        });
      }
    } catch (e) {
      setState(() {
        result = "Invalid Input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Weight (kg)"),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    weight = 0;
                  } else {
                    weight = double.tryParse(value) ?? 0;
                  }
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Height (cm)"),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    height = 0;
                  } else {
                    height = double.tryParse(value) ?? 0;
                  }
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text("Calculate BMI"),
            ),
            SizedBox(height: 16),
            Text(
              result,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
