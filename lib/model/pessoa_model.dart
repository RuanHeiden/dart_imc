import 'dart:ffi';

class PessoaModel {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;

  PessoaModel({
    String? nome,
    double? peso,
    double? altura,
  }) {
    _nome = nome ?? '';
    _peso = peso ?? 0;
    _altura = altura ?? 0;
  }

  String getNome() => _nome;
  double getPeso() => _peso;
  double getAltura() => _altura;

  void setNome({required String nome}) => _nome = nome;
  void setPeso({required double peso}) => _peso = peso;
  void setAltura({required double altura}) => _altura = altura;

  @override
  String toString() {
    return "Pessoa - Nome : ${getNome()}, Peso: ${getPeso()}, Altura: ${getAltura()}";
  }
}
