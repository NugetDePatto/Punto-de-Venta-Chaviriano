import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Producto {
  @HiveField(0)
  String id;
  @HiveField(1)
  String nombre;
  @HiveField(2)
  double precio;
  @HiveField(3)
  String categoria;
  @HiveField(4)
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
