import 'package:flutter/foundation.dart';
import 'shampoo.dart';

class shampooProvider extends ChangeNotifier {
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

  double restant = 0.0;    // lo que queda
  double consumit = 0.0;   // lo que se ha gastado
  int dosisConsumidas = 0;     // dosis que se gastan
  static const double dosis = 0.12;

  shampooProvider() {
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
    dosisConsumidas = 0;
  }

  void usarDosis() {
    if (restant <= 0) return;

    double toma = dosis;
    if (restant < dosis) toma = restant;

    restant -= toma;
    consumit += toma;
    dosisConsumidas += 1;

    // evitar negativos por precisión
    if (restant.abs() < 1e-9) restant = 0.0;

    notifyListeners();
  }
}