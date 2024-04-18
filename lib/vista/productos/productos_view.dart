import 'package:flutter/material.dart';
import 'package:puntoventa/controlador/productos_controlador.dart';
import 'package:puntoventa/vista/productos/a%C3%B1adir_productos_view.dart';
import 'package:puntoventa/vista/productos/editar_productos_view.dart';

class ProductosView extends StatefulWidget {
  const ProductosView({super.key});

  @override
  State<ProductosView> createState() => _ProductosViewState();
}

class _ProductosViewState extends State<ProductosView> {
  ProductosControlador productosControlador = ProductosControlador();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //este es un operador ternario, es como un if else, primero se evalua la condicion, si es verdadera se ejecuta lo que esta despues del signo de interrogacion, si es falsa se ejecuta lo que esta despues de los dos puntos
      body: productosControlador.productos.isEmpty
          ? const Center(
              child: Text('No hay productos'),
            )
          : Column(
              children: [
                for (var producto in productosControlador.productos)
                  ListTile(
                    title: Text(producto.nombre),
                    subtitle: Text(producto.categoria),
                    trailing: Text('\$${producto.precio}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditarProductosView(
                            producto: producto,
                          ),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                  ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AgregarProductoView(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
