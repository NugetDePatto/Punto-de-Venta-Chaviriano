import 'package:flutter/material.dart';
import 'package:puntoventa/controlador/productos_controlador.dart';
import 'package:puntoventa/modelo/producto_modelo.dart';

class AgregarProductoView extends StatefulWidget {
  const AgregarProductoView({super.key});

  @override
  State<AgregarProductoView> createState() => _AgregarProductoViewState();
}

class _AgregarProductoViewState extends State<AgregarProductoView> {
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController proveedorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
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
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí se debería guardar el producto en la base de datos
                  String mensaje = ProductosControlador().agregarProducto(
                    idController.text,
                    nombreController.text,
                    precioController.text,
                    categoriaController.text,
                    proveedorController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(mensaje),
                    ),
                  );

                  if (mensaje == 'Producto agregado') {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
