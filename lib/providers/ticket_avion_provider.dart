import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ticket_avion/models/ticket_avion.dart';

class TicketAvionProvider with ChangeNotifier {
  List<TicketAvion> _ticketsAvion = [];

  List<TicketAvion> get ticketsAvion => _ticketsAvion;

  Stream<List<TicketAvion>> get ticketsAvionStream {
    return FirebaseFirestore.instance.collection('ticketsAvion').snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => TicketAvion.fromJson(doc.data())).toList();
    });
  }

  Future<void> leerTicketsAvion() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('ticketsAvion').get();
      _ticketsAvion = querySnapshot.docs.map((doc) => TicketAvion.fromJson(doc.data())).toList();
      notifyListeners();
    } catch (e) {
      print('Error leyendo ticketsAvion: $e');
    }
  }

  Future<void> actualizarTicketAvion(TicketAvion ticketAvion) async {
    try {
      await FirebaseFirestore.instance.collection('ticketsAvion').doc(ticketAvion.numeroVuelo).update(ticketAvion.toJson());
      _ticketsAvion[_ticketsAvion.indexOf(ticketAvion)] = ticketAvion;
      notifyListeners();
    } catch (e) {
      print('Error actualizando ticketAvion: $e');
    }
  }

  Future<void> eliminarTicketAvion(TicketAvion ticketAvion) async {
    try {
      await FirebaseFirestore.instance.collection('ticketsAvion').doc(ticketAvion.numeroVuelo).delete();
      _ticketsAvion.remove(ticketAvion);
      notifyListeners();
    } catch (e) {
      print('Error eliminando ticketAvion: $e');
    }
  }

  Future<void> crearTicketAvion(TicketAvion ticketAvion) async {
    try {
      await FirebaseFirestore.instance.collection('ticketsAvion').add(ticketAvion.toJson());
      _ticketsAvion.add(ticketAvion);
      notifyListeners();
    } catch (e) {
      print('Error creando ticketAvion: $e');
    }
  }
}