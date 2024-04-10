import 'dart:convert';
import 'dart:io';

import 'package:calcula_imc/model/pessoa_model.dart';

void execute() {
  String? nome;
  double? peso;
  double? altura;

  intro();
  nome = blocoString(text: 'Informe seu nome');
  peso = blocoDouble(text: 'Informe a sua peso');
  altura = blocoDouble(text: 'Informe o seu altura');

  PessoaModel pessoaModel = PessoaModel(nome: nome, peso: peso, altura: altura);
  detalhesIMC(pessoa: pessoaModel);
}

void detalhesIMC({required PessoaModel pessoa}) {
  double imc = 0;
  imc = pessoa.getPeso() / (pessoa.getAltura() * pessoa.getAltura());
  divider();
  print("| Nome: ${pessoa.getNome().toUpperCase()}");
  print("| Altura: ${pessoa.getAltura()}");
  print("| Peso: ${pessoa.getPeso()}");
  print('| IMC: ${calculaIMC(
    peso: pessoa.getPeso(),
    altura: pessoa.getAltura(),
  )}');
  print('| Classificação IMC: ${tabelaIMC(imc: imc)}');
  divider();
}

double calculaIMC({required double peso, required double altura}) {
  if (peso == 0 || altura == 0) {
    throw ArgumentError("O peso/altura nao pode ser zero !!");
  }
  return (peso / (altura * altura));
}

String tabelaIMC({required double imc}) {
  switch (imc) {
    case < 16:
      return 'Magreza grave';

    case >= 16 && <= 17:
      return 'Magreza moderada';
    case >= 17 && <= 18.5:
      return 'Magreza leve';

    case >= 18.5 && < 25:
      return "Saudável";
    case >= 25 && <= 30:
      return "Sobrepeso";
    case >= 30 && <= 35:
      return "Sobrepeso Grau 1";
    case >= 35 && <= 40:
      return "Sobrepeso Grau 2 (severo)";
    case >= 40:
      return "Sobrepeso Grau 3 (mórbida)";
  }
  return 'Não foi possivel calcular';
}

void divider() {
  print("|--------------------------------");
}

double? blocoDouble({required String text}) {
  double? value;
  print(text);
  value = readLineDouble();
  return value;
}

String? blocoString({required String text}) {
  print(text);
  return readLine();
}

void intro() {
  print('-------------------------------');
  print('--------- CALCULA IMC ---------');
  print('-------------------------------');
}

double readLineDouble() {
  do {
    try {
      return double.parse(stdin.readLineSync(encoding: utf8) ?? '');
    } catch (e) {
      print('Informe um double valido');
    }
  } while (true);
}

dynamic readLine() {
  return stdin.readLineSync(encoding: utf8) ?? '';
}
