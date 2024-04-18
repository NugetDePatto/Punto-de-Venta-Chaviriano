import 'package:flutter/material.dart';
import 'package:puntoventa/Vista/categorias/categorias_view.dart';
import 'package:puntoventa/Vista/productos/productos_view.dart';
import 'package:puntoventa/Vista/ventas/ventas_view.dart';
import 'package:puntoventa/vista/compras/comprar_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  Widget vistas() {
    if (index == 0) {
      return const ComprarView();
    } else if (index == 1) {
      return const ProductosView();
    } else if (index == 2) {
      return const CategoriasView();
    }
    // else if (index == 3) {
    //   return const ProductosView();
    // }
    else if (index == 4) {
      return const VentasView();
    } else {
      return const Center(
        child: Text('Hubo un error al mostrar la vista'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Punto de Venta'),
      ),
      body: vistas(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        currentIndex: index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Comprar',
          ),
          BottomNavigationBarItem(
            label: 'Productos',
            icon: Icon(Icons.list_alt_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Categorias',
            icon: Icon(Icons.category_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Proveedores',
            icon: Icon(Icons.person_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Ventas',
            icon: Icon(Icons.attach_money_rounded),
          ),
        ],
        selectedItemColor: Colors.deepPurple,
      ),
    );
  }
}
