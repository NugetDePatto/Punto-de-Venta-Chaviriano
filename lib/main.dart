import 'package:flutter/material.dart';
import 'package:puntoventa/modelo/producto_modelo.dart';
import 'package:puntoventa/vista/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  initFlutter();

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

initFlutter() async {
  await Hive.initFlutter();

  // Los adaptadores sirven para que los modelos puedan ser guardados en Hive, ya que Hive no soporta guardar objetos de forma directa
  Hive.registerAdapter(ProductoAdapter());

  // Se abre la caja de productos, especificando el tipo de objeto que se guardará en ella
  await Hive.openBox<Producto>('productos');
}
