import 'package:flutter/material.dart';
import 'package:puntoventa/modelo/fila_venta_modelo.dart';
import 'package:puntoventa/modelo/producto_modelo.dart';
import 'package:puntoventa/modelo/venta_modelo.dart';
import 'package:puntoventa/vista/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  iniciandoHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

iniciandoHive() async {
  await Hive.initFlutter();

  await Hive.openBox('values');

  // Los adaptadores sirven para que los modelos puedan ser guardados en Hive, ya que Hive no soporta guardar objetos de forma directa
  Hive.registerAdapter(ProductoAdapter());

  // Se abre la caja de productos, especificando el tipo de objeto que se guardará en ella
  await Hive.openBox<Producto>('productos');

  //primero se registra el adaptador de la fila de venta porque la venta depende de ella, imagina que la fila de venta no está registrada, entonces la venta no sabría cómo guardarla, hay que tener un orden en el registro de los adaptadores porque si no, no funcionará
  Hive.registerAdapter(FilaVentaAdapter());

  //se registra el adaptador de la venta
  Hive.registerAdapter(VentaAdapter());

  await Hive.openBox<Venta>('ventas');
}
