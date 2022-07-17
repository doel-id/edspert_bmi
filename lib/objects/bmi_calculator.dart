import 'package:bmi/config.dart';

class BmiCalculator {
  double? height;
  double? weight;
  double? bmiValue;
  String? bmiCategory;
  String? bmiDescr;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmiValue);

  double calculateBmi() {
    var heightInMeter = height! / 100;

    final heightM2 = (heightInMeter * heightInMeter);
    bmiValue = weight! / heightM2;

    return bmiValue!;
  }

  String determineBmiCategory() {
    if (bmiValue! < 16.0) {
      bmiCategory = underweightSevere;
    } else if (bmiValue! < 17) {
      bmiCategory = underweightModerate;
    } else if (bmiValue! < 18.5) {
      bmiCategory = underweightMild;
    } else if (bmiValue! < 25) {
      bmiCategory = normal;
    } else if (bmiValue! < 30) {
      bmiCategory = overweight;
    } else if (bmiValue! < 35) {
      bmiCategory = obeseI;
    } else if (bmiValue! < 40) {
      bmiCategory = obeseII;
    } else if (bmiValue! >= 40) {
      bmiCategory = obeseIII;
    }
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        bmiDescr = "Possible nutritional deficiency and osteoporosis";
        break;
      case normal:
        bmiDescr = "Low risk (healthy range)";
        break;
      case overweight:
        bmiDescr =
            "Moderate risk of developing heart disease, high blood presure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        bmiDescr =
            "High risk of developing heart disease, high blood presure, stroke, diabetes mellitus.";
        break;
      default:
        break;
    }
    return bmiDescr!;
  }
}
