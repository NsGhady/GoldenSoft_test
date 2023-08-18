import 'package:flutter/material.dart';
import 'package:golden_soft_test/views/map_view.dart';
import 'package:golden_soft_test/views/vehicle_reg_view.dart';
import 'package:golden_soft_test/views/splash_view.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VehicleRegistrationModel()),
        ChangeNotifierProvider(create: (_) => MapModel())
      ],
      child: MaterialApp(
        title: 'GoldenSoft',
        theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: SplashView(),
      ),
    );
  }
}
