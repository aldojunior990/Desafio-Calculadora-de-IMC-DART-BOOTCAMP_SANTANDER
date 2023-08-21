import 'package:intl/intl.dart';

class Person {
  String _name = "";
  double _height = 0.0;
  double _weight = 0.0;

  void setName(String name) => _name = name;
  void setHeight(double height) => _height = height;
  void setWeight(double weight) => _weight = weight;

  String getName() => _name;
  double getHeight() => _height;
  double getWeight() => _weight;
  double getImc() =>
      double.parse(NumberFormat("#.00").format(_weight / (_height * _height)));

  String getImcAnalyzer() {
    double imc = _weight / (_height * _height);
    String response = "";
    switch (imc) {
      case (< 16):
        response = "Magreza grave";
        break;
      case (>= 16 && < 17):
        response = "Magreza moderada";
        break;
      case (>= 17 && < 18.5):
        response = "Magreza leve";
        break;
      case (>= 18.5 && < 25):
        response = "Saudavel";
        break;
      case (>= 25 && < 30):
        response = "Sobrepeso";
        break;
      case (>= 30 && < 35):
        response = "Obesidade grau 1";
        break;
      case (>= 35 && < 40):
        response = "Obesidade grau 2 (severa)";
        break;
      case (>= 40):
        response = "Obesidade grau 3 (morbida)";
        break;
    }

    return response;
  }

  Person(String name, double height, double weight) {
    _name = name;
    _height = height;
    _weight = weight;
  }
}
