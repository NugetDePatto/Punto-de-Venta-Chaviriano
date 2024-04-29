import 'package:hive/hive.dart';

class FilaVenta {
  String idProducto;
  int cantidad;
  double subtotal;

  FilaVenta({
    required this.idProducto,
    required this.cantidad,
    this.subtotal = 0,
  });
}

class FilaVentaAdapter extends TypeAdapter<FilaVenta> {
  @override
  final int typeId = 1;

  @override
  FilaVenta read(BinaryReader reader) {
    return FilaVenta(
      idProducto: reader.readString(),
      cantidad: reader.readInt(),
      subtotal: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, FilaVenta obj) {
    writer.writeString(obj.idProducto);
    writer.writeInt(obj.cantidad);
    writer.writeDouble(obj.subtotal);
  }
}
