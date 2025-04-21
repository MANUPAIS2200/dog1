class Usuario {
  String uid;
  String nombre;
  String email;
  int? edad;
  String? sexo;
  int nivel;
  int puntos;

  Usuario({
    required this.uid,
    required this.nombre,
    required this.email,
    this.edad,
    this.sexo,
    this.nivel = 1,
    this.puntos = 0,
  });

  // Convertir un Usuario a Map para Firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nombre': nombre,
      'email': email,
      'edad': edad,
      'sexo': sexo,
      'nivel': nivel,
      'puntos': puntos,
    };
  }

  // Crear Usuario desde un snapshot de Firebase
  factory Usuario.fromMap(Map<String, dynamic> map, String uid) {
    return Usuario(
      uid: uid,
      nombre: map['nombre'],
      email: map['email'],
      edad: map['edad'],
      sexo: map['sexo'],
      nivel: map['nivel'] ?? 1,
      puntos: map['puntos'] ?? 0,
    );
  }
}
