import 'package:hive/hive.dart';

class Producto {
  String id;
  String nombre;
  double precio;
  String categoria;
  String proveedor;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
    required this.proveedor,
  });
}

class ProductoAdapter extends TypeAdapter<Producto> {
  @override
  final int typeId = 0;

  @override
  Producto read(BinaryReader reader) {
    return Producto(
      id: reader.readString(),
      nombre: reader.readString(),
      precio: reader.readDouble(),
      categoria: reader.readString(),
      proveedor: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Producto obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.nombre);
    writer.writeDouble(obj.precio);
    writer.writeString(obj.categoria);
    writer.writeString(obj.proveedor);
  }
}
