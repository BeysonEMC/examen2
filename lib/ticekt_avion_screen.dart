import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ticket_avion/models/ticket_avion.dart';
import 'package:flutter_ticket_avion/providers/ticket_avion_provider.dart';

class TicketAvionScreen extends StatefulWidget {
  @override
  _TicketAvionScreenState createState() => _TicketAvionScreenState();
}

class _TicketAvionScreenState extends State<TicketAvionScreen> {
  final _numeroVueloController = TextEditingController();
  final _aerolineaController = TextEditingController();
  final _informacionPasajeroController = TextEditingController();
  final _origenController = TextEditingController();
  final _destinoController = TextEditingController();
  final _asientoController = TextEditingController();
  final _claseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Avion'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => TicketAvionProvider(),
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                TextField(
                  controller: _numeroVueloController,
                  decoration: InputDecoration(
                    labelText: 'Número de vuelo',
                  ),
                ),
                TextField(
                  controller: _aerolineaController,
                  decoration: InputDecoration(
                    labelText: 'Aerolínea',
                  ),
                ),
                TextField(
                  controller: _informacionPasajeroController,
                  decoration: InputDecoration(
                    labelText: 'Información del pasajero',
                  ),
                ),
                TextField(
                  controller: _origenController,
                  decoration: InputDecoration(
                    labelText: 'Origen',
                  ),
                ),
                TextField(
                  controller: _destinoController,
                  decoration: InputDecoration(
                    labelText: 'Destino',
                  ),
                ),
                TextField(
                  controller: _asientoController,
                  decoration: InputDecoration(
                    labelText: 'Asiento',
                  ),
                ),
                TextField(
                  controller: _claseController,
                  decoration: InputDecoration(
                    labelText: 'Clase',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final ticketAvion = TicketAvion(
                      numeroVuelo: _numeroVueloController.text,
                      aerolinea: _aerolineaController.text,
                      informacionPasajero: _informacionPasajeroController.text,
                      origen: _origenController.text,
                      destino: _destinoController.text,
                      asiento: _asientoController.text,
                      clase: _claseController.text,
                    );
                    Provider.of<TicketAvionProvider>(context, listen: false).crearTicketAvion(ticketAvion);
                    _numeroVueloController.clear();
                    _aerolineaController.clear();
                    _informacionPasajeroController.clear();
                    _origenController.clear();
                    _destinoController.clear();
                    _asientoController.clear();
                    _claseController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ticket ingresado correctamente')),
                    );
                  },
                  child: Text('Crear ticket avion'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}