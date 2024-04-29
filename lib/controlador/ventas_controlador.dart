import 'package:hive/hive.dart';
import 'package:puntoventa/modelo/fila_venta_modelo.dart';
import 'package:puntoventa/modelo/venta_modelo.dart';

class VentasControlador {
  final Box<Venta> ventasBox = Hive.box<Venta>('ventas');

  List<Venta> get ventas => ventasBox.values.toList();

  String agregarVenta(List<FilaVenta> filas) {
    if (filas.isEmpty) {
      return 'No hay productos en la venta';
    }

    Box box = Hive.box('values');
    var totalVentas = box.get('totalVentas', defaultValue: 0);

    ventasBox.put(
      totalVentas.toString(),
      Venta(
        id: totalVentas.toString(),
        fecha: DateTime.now().toString(),
        productos: filas,
      ),
    );

    totalVentas += 1;
    box.put('totalVentas', totalVentas);

    return 'Venta agregada';
  }

  ejemploVenta() {
    Box box = Hive.box('values');
    var totalVentas = box.get('totalVentas', defaultValue: 0);

    ventasBox.put(
      totalVentas.toString(),
      Venta(
        id: totalVentas.toString(),
        fecha: DateTime.now().toString(),
        productos: [
          FilaVenta(idProducto: '1', cantidad: 2, subtotal: 100.0),
        ],
      ),
    );

    totalVentas += 1;
    box.put('totalVentas', totalVentas);
  }
}
