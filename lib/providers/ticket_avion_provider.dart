import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ticket_avion/models/ticket_avion.dart';
import 'package:flutter/foundation.dart';

class TicketAvionProvider with ChangeNotifier {
  List<TicketAvion> _ticketsAvion = [];

  List<TicketAvion> get ticketsAvion => _ticketsAvion;

  Future<void> leerTicketsAvion() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('ticketsAvion').get();
    _ticketsAvion = querySnapshot.docs.map((doc) => TicketAvion.fromJson(doc.data())).toList();
    notifyListeners();
  }

  Future<void> actualizarTicketAvion(TicketAvion ticketAvion) async {
    await FirebaseFirestore.instance.collection('ticketsAvion').doc(ticketAvion.numeroVuelo).update(ticketAvion.toJson());
    _ticketsAvion[_ticketsAvion.indexOf(ticketAvion)] = ticketAvion;
    notifyListeners();
  }

  Future<void> eliminarTicketAvion(TicketAvion ticketAvion) async {
    await FirebaseFirestore.instance.collection('ticketsAvion').doc(ticketAvion.numeroVuelo).delete();
    _ticketsAvion.remove(ticketAvion);
    notifyListeners();
  }
  Future<void> crearTicketAvion(TicketAvion ticketAvion) async {
    await FirebaseFirestore.instance.collection('ticketsAvion').add(ticketAvion.toJson());
    _ticketsAvion.add(ticketAvion);
    notifyListeners();
  }
}