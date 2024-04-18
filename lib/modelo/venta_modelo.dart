import 'package:puntoventa/modelo/fila_venta_modelo.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Venta {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String fecha;
  @HiveField(2)
  double total;
  @HiveField(3)
  final List<FilaVenta> productos;

  Venta({
    required this.id,
    required this.fecha,
    this.total = 0,
    required this.productos,
  });

  double totalVenta() {
    for (var producto in productos) {
      total += producto.subtotal;
    }

    return total;
  }
}

class VentaAdapter extends TypeAdapter<Venta> {
  @override
  final int typeId = 2;

  @override
  Venta read(BinaryReader reader) {
    return Venta(
      id: reader.readInt(),
      fecha: reader.readString(),
      total: reader.readDouble(),
      productos: reader.readList().cast<FilaVenta>(),
    );
  }

  @override
  void write(BinaryWriter writer, Venta obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.fecha);
    writer.writeDouble(obj.total);
    writer.writeList(obj.productos);
  }
}
