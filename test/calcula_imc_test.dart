import 'dart:html';

import 'package:calcula_imc/calcula_imc.dart' as imc;
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Calcula imc', () {
    expect(imc.calculaIMC(peso: 72, altura: 1.7).toStringAsFixed(2), '24.91');
  });

  test('Calcula imc com peso zerado', () {
    expect(
      () => imc.calculaIMC(peso: 0, altura: 1.7),
      throwsA(TypeMatcher<ArgumentError>()),
    );
  });

  group('Teste de grupo', () {
    var listTesteGroup = [
      {'nome': 'Teste - 1', 'peso': 80.0, 'altura': 1.80, 'expt': 24.69},
      {'nome': 'teste - 2', 'peso': 76.0, 'altura': 1.62, 'expt': 28.96},
    ];

    for (var value in listTesteGroup) {
      test(
        'IMC - Name: ${value['nome']}',
        () {
          var resultado = imc
              .calculaIMC(
                  peso: value['peso'] as double,
                  altura: value['altura'] as double)
              .toStringAsFixed(2);
          expect(resultado, value['expt'].toString());
        },
      );
    }
  });
}
