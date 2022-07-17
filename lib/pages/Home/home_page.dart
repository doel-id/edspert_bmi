import 'package:bmi/config.dart';
import 'package:bmi/objects/bmi_calculator.dart';
import 'package:bmi/pages/Result/result_page.dart';
import 'package:bmi/widgets/border_widget.dart';
import 'package:bmi/widgets/icon_text_widget.dart';
import 'package:bmi/widgets/text_style_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 100;
  double _weight = 50;
  double _age = 20;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(
            height: _height,
            weight: _weight,
          );
          bmiCalculator.calculateBmi();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return ResultPage(
                  bmi: bmiCalculator.bmiValue!,
                  bmiCalculator: bmiCalculator,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 55,
          color: selectColor,
          child: const Center(
            child: TextStyleWidget(
              text: "CALCULATE YOUR BMI",
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _gender = "male";
                              setState(() {});
                            },
                            child: BorderWidget(
                              color: (_gender == "male")
                                  ? selectColor
                                  : secondaryColor,
                              child: const IconTextWidget(
                                icon: Icons.male,
                                text: "MALE",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _gender = "female";
                              setState(() {});
                            },
                            child: BorderWidget(
                              color: (_gender == "female")
                                  ? selectColor
                                  : secondaryColor,
                              child: const IconTextWidget(
                                icon: Icons.female,
                                text: "FEMALE",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: BorderWidget(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextStyleWidget(
                            text: "HEIGHT",
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextStyleWidget(
                                text: "$_height",
                                fontSize: 38,
                                fontColor: enableColor,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              TextStyleWidget(
                                text: "cm",
                              ),
                            ],
                          ),
                          Slider(
                            value: _height,
                            min: 20,
                            max: 350,
                            thumbColor: selectColor,
                            activeColor: enableColor,
                            inactiveColor: disableColor,
                            onChanged: (value) {
                              _height = value.round().toDouble();
                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: BorderWidget(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextStyleWidget(
                                text: "WEIGHT",
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              TextStyleWidget(
                                text: "$_weight",
                                fontSize: 38,
                                fontColor: enableColor,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {
                                      _weight += 1;
                                      setState(() {});
                                    },
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    fillColor: disableColor,
                                    highlightColor: selectColor,
                                    constraints: const BoxConstraints.tightFor(
                                      width: 42,
                                      height: 42,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  RawMaterialButton(
                                    onPressed: () {
                                      _weight -= 1;
                                      setState(() {});
                                    },
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    fillColor: disableColor,
                                    highlightColor: selectColor,
                                    constraints: const BoxConstraints.tightFor(
                                      width: 42,
                                      height: 42,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: BorderWidget(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextStyleWidget(
                                text: "AGE",
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              TextStyleWidget(
                                text: "$_age",
                                fontSize: 38,
                                fontColor: enableColor,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {
                                      _age += 1;
                                      setState(() {});
                                    },
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    fillColor: disableColor,
                                    highlightColor: selectColor,
                                    constraints: const BoxConstraints.tightFor(
                                      width: 42,
                                      height: 42,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  RawMaterialButton(
                                    onPressed: () {
                                      _age -= 1;
                                      setState(() {});
                                    },
                                    elevation: 0,
                                    shape: const CircleBorder(),
                                    fillColor: disableColor,
                                    highlightColor: selectColor,
                                    constraints: const BoxConstraints.tightFor(
                                      width: 42,
                                      height: 42,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
