import 'package:hive/hive.dart';
import 'package:puntoventa/modelo/producto_modelo.dart';

class ProductosControlador {
  final Box<Producto> productosBox = Hive.box<Producto>('productos');

  List<Producto> get productos => productosBox.values.toList();

  String agregarProducto(id, nombre, precio, categoria, proveedor) {
    if (productosBox.containsKey(id)) {
      return 'El producto ya existe';
    }

    if (double.tryParse(precio) == null) {
      return 'El precio debe ser un número';
    }

    if (id.isEmpty ||
        nombre.isEmpty ||
        precio == 0 ||
        categoria.isEmpty ||
        proveedor.isEmpty) {
      return 'Por favor llena todos los campos';
    }

    productosBox.put(
      id,
      Producto(
        id: id,
        nombre: nombre,
        precio: double.parse(precio),
        categoria: categoria,
        proveedor: proveedor,
      ),
    );

    return 'Producto agregado';
  }

  String editarProducto(id, nombre, precio, categoria, proveedor) {
    //excepciones para los campos vacios
    if (!productosBox.containsKey(id)) {
      return 'El producto no existe';
    }

    if (double.tryParse(precio) == null) {
      return 'El precio debe ser un número';
    }

    if (id.isEmpty ||
        nombre.isEmpty ||
        precio == 0 ||
        categoria.isEmpty ||
        proveedor.isEmpty) {
      return 'Por favor llena todos los campos';
    }

    productosBox.put(
      id,
      Producto(
        id: id,
        nombre: nombre,
        precio: precio,
        categoria: categoria,
        proveedor: proveedor,
      ),
    );

    return 'Producto editado';
  }

  String eliminarProducto(id) {
    if (!productosBox.containsKey(id)) {
      return 'El producto no existe';
    }

    productosBox.delete(id);

    return 'Producto eliminado';
  }
}
