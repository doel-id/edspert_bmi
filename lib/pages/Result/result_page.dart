import 'package:bmi/config.dart';
import 'package:bmi/objects/bmi_calculator.dart';
import 'package:bmi/widgets/border_widget.dart';
import 'package:bmi/widgets/text_style_widget.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.bmi, required this.bmiCalculator})
      : super(key: key);

  final double bmi;
  final BmiCalculator bmiCalculator;

  @override
  Widget build(BuildContext context) {
    final bmiCategory = bmiCalculator.determineBmiCategory();
    final bmiDescr = bmiCalculator.getHealRiskDescription();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI RESULT"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 55,
          color: selectColor,
          child: const Center(
            child: TextStyleWidget(
              text: "RE-CALCULATE",
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your Result",
            style: TextStyle(
              fontSize: 32,
              color: disableColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: BorderWidget(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          textAlign: TextAlign.center,
                          bmiCategory,
                          style: const TextStyle(
                            fontSize: 24,
                            color: disableColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 64,
                          color: disableColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          textAlign: TextAlign.center,
                          bmiDescr,
                          style: const TextStyle(
                            fontSize: 12,
                            color: disableColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
