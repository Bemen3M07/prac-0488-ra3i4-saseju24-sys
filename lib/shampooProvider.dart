import 'package:flutter/foundation.dart';
import 'shampoo.dart';

class ShampooProvider extends ChangeNotifier {
  final List<Shampoo> shampoos = [
    Shampoo(marca: 'Pantene', quantitat: 300.0),
    Shampoo(marca: 'Timotei', quantitat: 250.0),
    Shampoo(marca: 'H&S', quantitat: 260.0),
    Shampoo(marca: 'Garnier Fructis', quantitat: 200.0),
    Shampoo(marca: 'L\'Oréal Elvive', quantitat: 250.0),
    Shampoo(marca: 'Tresemmé', quantitat: 400.0),
    Shampoo(marca: 'Kérastase', quantitat: 250.0),
    Shampoo(marca: 'Wella Professionals', quantitat: 300.0),
  ];

  late Shampoo shampooSeleccionado;

  // datos que calculamos y mantenemos, simlemente se utilizan en los metodos
  static const double doseMl = 12.0;
  final Map<int, double> _restantes = {};
  final Map<int, double> _consumidos = {};
  final Map<int, int> _dosis = {};

  ShampooProvider() {
    shampooSeleccionado = shampoos.first;
    for (int i = 0; i < shampoos.length; i++) {
      _restantes[i] = shampoos[i].quantitat;
      _consumidos[i] = 0.0;
      _dosis[i] = 0;
    }
  }

  void canviarShampoo(Shampoo s) {
    shampooSeleccionado = s;
    notifyListeners();
  }

  int get _selectedIndex => shampoos.indexOf(shampooSeleccionado);

  double get restanteSeleccionado =>
      _restantes[_selectedIndex] ?? shampooSeleccionado.quantitat;
  double get consumidoSeleccionado => _consumidos[_selectedIndex] ?? 0.0;
  int get dosisSeleccionadas => _dosis[_selectedIndex] ?? 0;

  // cada dosis resta 12 ml
  void usarDosis() {
    final idx = _selectedIndex;
    if (idx < 0) return;

    double restante = _restantes[idx] ?? shampooSeleccionado.quantitat;
    if (restante <= 0) return;

    double toma = doseMl;
    if (restante < doseMl) toma = restante;

    restante -= toma;
    double consumido = (_consumidos[idx] ?? 0.0) + toma;
    int dosis = (_dosis[idx] ?? 0) + 1;

    if (restante.abs() < 1e-9) restante = 0.0;

    _restantes[idx] = restante;
    _consumidos[idx] = consumido;
    _dosis[idx] = dosis;

    notifyListeners();
  }
}
