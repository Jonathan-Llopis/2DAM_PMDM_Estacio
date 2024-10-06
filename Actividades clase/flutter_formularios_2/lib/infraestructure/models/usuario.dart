class Usuario {
  String nombre;
  String apellidos;
  int edad;
  String correo;
  String sexo;
  var aficiones = [];

  Usuario(this.nombre, this.apellidos, this.edad, this.correo, this.sexo,
      this.aficiones);

  void mostrarUsuario() {
    print("Nombre: $nombre, Apellidos: $apellidos, Edad: $edad, Correo: $correo, Sexo: $sexo, Aficiones: $aficiones");
  }
}
