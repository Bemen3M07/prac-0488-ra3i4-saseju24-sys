import 'package:empty/shampooProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pantalla2 extends StatefulWidget {
  const pantalla2({super.key});

  @override
  State<pantalla2> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<pantalla2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _actualizarResumen());
  }

  void _actualizarResumen() {
    final prov = Provider.of<ShampooProvider>(context, listen: false);
    final s = prov.shampooSeleccionado;
  }

  void _usarDosis() {
    final prov = Provider.of<ShampooProvider>(context, listen: false);
    prov.usarDosis();
    _actualizarResumen();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ShampooProvider>(context);
    final s = prov.shampooSeleccionado;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del shampoo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Marca: ${s.marca}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Cantidad original: ${s.quantitat} ml'),
            const SizedBox(height: 8),
            Text(
              'Queda: ${prov.restanteSeleccionado} ml',
              style: TextStyle(
                color: prov.restanteSeleccionado < (s.quantitat / 2)
                    ? Colors.red
                    : Colors.black, 
              ),
            ),
            const SizedBox(height: 8),
            Text('Gastado: ${prov.consumidoSeleccionado} ml'),
            const SizedBox(height: 8),
            Text('Dosis gastadas (Dosis = 12ml): ${prov.dosisSeleccionadas}'),
            const SizedBox(height: 16),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: prov.restanteSeleccionado > 0 ? _usarDosis : null,
                child: Text(prov.restanteSeleccionado > 0
                    ? 'Usar 1 dosis (${ShampooProvider.doseMl} ml)'
                    : 'No queda shampoo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
