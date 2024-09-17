import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ticket_avion/models/ticket_avion.dart';
import 'package:flutter_ticket_avion/providers/ticket_avion_provider.dart';

class TicketAvionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TicketAvionProvider(),
      child: Scaffold(
      appBar: AppBar(
        title: Text('Ticket Avion'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Número de vuelo',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Aerolínea',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Información del pasajero',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Origen',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Destino',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Asiento',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Clase',
            ),
          ),
          ElevatedButton(
  onPressed: () {
    final ticketAvion = TicketAvion(
      numeroVuelo: '12345',
      aerolinea: 'Aerolínea 1',
      informacionPasajero: 'Información del pasajero',
      origen: 'Origen',
      destino: 'Destino',
      asiento: 'Asiento',
      clase: 'Clase',
    );
    Provider.of<TicketAvionProvider>(context, listen: false).crearTicketAvion(ticketAvion);
  },
  child: Text('Crear ticket avion'),
),
          ],
        ),
      ),
    );
  }
}