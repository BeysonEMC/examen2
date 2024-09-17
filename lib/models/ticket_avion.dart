class TicketAvion {
  String numeroVuelo;
  String aerolinea;
  String informacionPasajero;
  String origen;
  String destino;
  String asiento;
  String clase;

  TicketAvion({
    required this.numeroVuelo,
    required this.aerolinea,
    required this.informacionPasajero,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  factory TicketAvion.fromJson(Map<String, dynamic> json) {
    return TicketAvion(
      numeroVuelo: json['numeroVuelo'],
      aerolinea: json['aerolinea'],
      informacionPasajero: json['informacionPasajero'],
      origen: json['origen'],
      destino: json['destino'],
      asiento: json['asiento'],
      clase: json['clase'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'informacionPasajero': informacionPasajero,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }
}