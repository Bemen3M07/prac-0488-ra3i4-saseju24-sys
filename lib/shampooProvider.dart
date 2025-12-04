import 'package:flutter/foundation.dart';
import 'shampoo.dart';

class ShampooProvider extends ChangeNotifier {
  final List<Shampoo> shampoos = [
    Shampoo(marca: 'shampoo1', quantitat: 300.0),
    Shampoo(marca: 'shampoo2', quantitat: 250.0),
    Shampoo(marca: 'shampoo3', quantitat: 200.0),
    Shampoo(marca: 'shampoo4', quantitat: 180.0),
  ];

  late Shampoo shampooSeleccionado;

  double restant = 0.0;    // queda en ml
  double consumit = 0.0;   // gastado en ml
  int consumedDoses = 0;     // dosis gastadas (cada pulsación cuenta como 1)
  static const double doseMl = 12.0;

  ShampooProvider() {
    shampooSeleccionado = shampoos.first;
    _resetState();
  }

  void cambiarShampoo(Shampoo s) {
    shampooSeleccionado = s;
    _resetState();
    notifyListeners();
  }

  void _resetState() {
    restant = shampooSeleccionado.quantitat;
    consumit = 0.0;
    consumedDoses = 0;
  }

  void usarDosis() {
    if (restant <= 0) return;

    double toma = doseMl;
    if (restant < doseMl) toma = restant;

    restant -= toma;
    consumit += toma;
    consumedDoses += 1;

    // evitar negativos por precisión
    if (restant.abs() < 1e-9) restant = 0.0;

    notifyListeners();
  }
}