import 'package:flutter/material.dart';
import 'package:flutter_ticket_avion/ticekt_avion_screen.dart';
import 'package:flutter_ticket_avion/src/settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  MyApp({required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ticket Avion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicketAvionScreen(),
    );
  }
}