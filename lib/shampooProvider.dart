import 'package:flutter/foundation.dart';
import 'shampoo.dart';

class ShampooProvider extends ChangeNotifier {
  final List<Shampoo> Shampus = [
Shampoo(marca: 'Pantene', quantitat: 1.0,),
Shampoo(marca: 'Timotei', quantitat: 1.1,),
Shampoo(marca: 'H&S (H&S)',quantitat: 1.0,),
Shampoo(marca: 'Garnier Fructis',quantitat: 1.0,),
Shampoo(marca: 'L\'Oréal Elvive',quantitat: 2.5,),
Shampoo(marca: 'Tresemmé',quantitat: 4.0,),
Shampoo(marca: 'Kérastase',quantitat: 4.0,),
Shampoo(marca: 'Wella Professionals',quantitat: 5.0,),
];

  

  late Shampoo shampooSeleccionado;

  double restant = 0.0;    // queda en ml
  double consumit = 0.0;   // gastado en ml
  int consumedDoses = 0;     // dosis gastadas (cada pulsación cuenta como 1)
  static const double doseMl = 12.0;

  ShampooProvider() {
    shampooSeleccionado = Shampus.first;
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