import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<estudiantes>> BuscaEstudiantes() async {
  var url = Uri.parse("http://localhost/rutaapi/consultaestudiantes.php");

  final response = await http.get(url);

  return compute(pasaraListarusuario, response.body);
}

////////////// Pasar ListarUsuario
List<estudiantes> pasaraListarusuario(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar.map<estudiantes>((json) => estudiantes.fromJson(json)).toList();
}
////////////////

class estudiantes {
  final codigo;
  final nombre;
  final apellido;
  final identificacion;
  final curso;

  estudiantes(
      {this.codigo,
      this.nombre,
      this.apellido,
      this.identificacion,
      this.curso});

  factory estudiantes.fromJson(Map<String, dynamic> json) {
    return estudiantes(
      codigo: json['codigo'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      identificacion: json['identificacion'],
      curso: json['curso'],
    );
  }
}
