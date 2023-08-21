import 'dart:io';
import 'dart:convert';
import 'package:imc_calculator/classes/person.dart';

void main(List<String> arguments) {
  print("Bem vindo a calculadora de IMC");
  bool exit = true;
  List<Person> listOfPeoples = [];
  while (exit) {
    print("\n1 - Adicionar pessoa\n2 - Listar pessoas\n3 - Sair");
    var line = stdin.readLineSync(encoding: utf8);

    switch (line) {
      case '1':
        handleToAddPerson(listOfPeoples);
        break;
      case '2':
        srollList(listOfPeoples);
        break;
      case '3':
        exit = false;
        break;
      default:
        print("\nOpção inválida");
        break;
    }
  }
}

void srollList(List<Person> list) {
  int i = 1;
  for (var it in list) {
    print(
        "\n($i) Nome: ${it.getName()} | Peso: ${it.getWeight()} kg | Altura: ${it.getHeight()} metros | Imc: ${it.getImc()} ${it.getImcAnalyzer()}");
    i++;
  }
}

void handleToAddPerson(List<Person> list) {
  String name = readTerminal("Insira um nome", nameIsValid);
  double height =
      double.parse(readTerminal("Insira uma altura", heightIsValid));
  double weight = double.parse(readTerminal("Insira um peso", weightIsValid));

  Person person = Person(name, height, weight);
  list.add(person);
  print(
      "\nPessoa adicionada!\nNome: ${person.getName()} | Peso: ${person.getWeight()} kg | Altura: ${person.getHeight()} metros | Imc: ${person.getImc()} ${person.getImcAnalyzer()}");
}

bool nameIsValid(String name) {
  if (name == "" || name.trim().isEmpty) {
    throw ArgumentError('O nome não pode ser vazio');
  } else if (name.contains(RegExp(r'[0-9]'))) {
    throw ArgumentError('O nome não pode conter numeros');
  }

  return true;
}

bool weightIsValid(String weight) {
  if (double.parse(weight) < 0) {
    throw ArgumentError('O peso não pode ser negativo');
  }
  return true;
}

bool heightIsValid(String height) {
  if (double.parse(height) < 0) {
    throw ArgumentError('A altura não pode ser negativa');
  } else if (double.parse(height) > 3) {
    throw ArgumentError('Informe uma altura menor que 3 metros');
  }
  return true;
}

String readTerminal(String statement, Function validateFunction) {
  bool isRunning = true;
  String result = "";
  while (isRunning) {
    print("\n$statement");
    var line = stdin.readLineSync(encoding: utf8);
    try {
      if (validateFunction(line.toString())) {
        result = line.toString();
        isRunning = false;
      }
    } catch (err) {
      print(err);
    }
  }
  return result;
}
