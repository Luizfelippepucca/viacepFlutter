import 'dart:math';

class GerarNumero {
  static int gerarNumeroAleatorio(int number) {
    final Random ramdom = Random();
    return ramdom.nextInt(number);
  }
}
