import 'package:imc_calculator/classes/person.dart';
import 'package:test/test.dart';

import '../bin/imc_calculator.dart';

void main() {
  test('Teste da função getImc()', () {
    expect(Person("aldo", 1.80, 64).getImc(), 19.75);
  });

  test('Teste da função nameIsValid() retornando true', () {
    expect(nameIsValid("aldo"), true);
  });

  test('Teste da função nameIsValid() retornando uma exceção por ser vazia',
      () {
    expect(
        () => nameIsValid(""),
        throwsA(isA<ArgumentError>().having(
          (error) => error.message,
          'Invalid argument(s)',
          'O nome não pode ser vazio',
        )));
  });

  test(
      'Teste da função nameIsValid() retornando uma exceção por conter numeros',
      () {
    expect(
        () => nameIsValid("aldo1"),
        throwsA(isA<ArgumentError>().having(
          (error) => error.message,
          'Invalid argument(s)',
          'O nome não pode conter numeros',
        )));
  });

  test('Teste da função weightIsValid() retornando true', () {
    expect(weightIsValid(64.toString()), true);
  });
  test(
      'Teste da função weightIsValid() retornando exceção se o peso for negativo',
      () {
    expect(
        () => weightIsValid((-64).toString()),
        throwsA(isA<ArgumentError>().having(
          (error) => error.message,
          'Invalid argument(s)',
          'O peso não pode ser negativo',
        )));
  });

  test('Teste da função heightIsValid() retornando true', () {
    expect(heightIsValid(1.90.toString()), true);
  });
  test(
      'Teste da função heightIsValid() retornando exceção se a altura for negativa',
      () {
    expect(
        () => heightIsValid((-1.90).toString()),
        throwsA(isA<ArgumentError>().having(
          (error) => error.message,
          'Invalid argument(s)',
          'A altura não pode ser negativa',
        )));
  });

  test(
      'Teste da função heightIsValid() retornando exceção se a altura for maior que 3 metros',
      () {
    expect(
        () => heightIsValid((3.1).toString()),
        throwsA(isA<ArgumentError>().having(
          (error) => error.message,
          'Invalid argument(s)',
          'Informe uma altura menor que 3 metros',
        )));
  });
}
