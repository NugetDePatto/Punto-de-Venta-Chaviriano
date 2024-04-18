import 'package:flutter/material.dart';
import 'package:puntoventa/controlador/productos_controlador.dart';
import 'package:puntoventa/modelo/producto_modelo.dart';

class EditarProductosView extends StatefulWidget {
  final Producto producto;

  const EditarProductosView({
    super.key,
    required this.producto,
  });

  @override
  State<EditarProductosView> createState() => _EditarProductosViewState();
}

class _EditarProductosViewState extends State<EditarProductosView> {
  ProductosControlador productosControlador = ProductosControlador();

  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController proveedorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoriaController.text = widget.producto.categoria;
    idController.text = widget.producto.id;
    nombreController.text = widget.producto.nombre;
    precioController.text = widget.producto.precio.toString();
    proveedorController.text = widget.producto.proveedor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              //esto hace que el campo sea de solo lectura
              readOnly: true,
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(
                labelText: 'Precio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: categoriaController,
              decoration: const InputDecoration(
                labelText: 'Categoria',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: proveedorController,
              decoration: const InputDecoration(
                labelText: 'Proveedor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí se debería guardar el producto
                String mensaje = productosControlador.editarProducto(
                  idController.text,
                  nombreController.text,
                  double.parse(precioController.text),
                  categoriaController.text,
                  proveedorController.text,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(mensaje),
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text('Editar'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Aquí se debería guardar el producto
                String mensaje =
                    productosControlador.eliminarProducto(idController.text);

                Navigator.pop(context);
              },
              child: const Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}
