class Usuario {
  String nombre;
  String apellidos;
  int edad;
  String correo;
  String sexo;
  var aficiones = [];

  Usuario(this.nombre, this.apellidos, this.edad, this.correo, this.sexo,
      this.aficiones);

  String mostrarUsuario() {
    return  "Nombre: $nombre \n Apellidos: $apellidos\n Edad: $edad\n Correo: $correo\n Sexo: $sexo\n Aficiones: $aficiones";
  }
}
