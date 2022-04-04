import 'dart:io';

void main() {
  //Declaracion de todas las variables
  int nochesSuite=0, nochesJunior=0, personasSuite=0, personasJunior=0;
  double precioSuiteNormal = 0,
      nochesSuiteAdicionales = 0,
      precioSuiteNochesAdicionales = 0,
      precioSuiteUnitario = 0,
      precioSuiteTotal = 0,
      precioJuniorNormal = 0,
      nochesJuniorAdicionales = 0,
      precioJuniorNochesAdicionales = 0,
      precioJuniorUnitario = 0,
      precioJuniorTotal = 0,
      precioSubtotalHabitaciones = 0,
      descuentoPorTarjeta = 0,
      totalFinal = 0;
  String? habitacionElegida, repetir;
  do {
    stdout.write("Elige el tipo de habitacion: SUITE / JUNIOR:");
    habitacionElegida = stdin.readLineSync();
    
    if (habitacionElegida == "SUITE") {
      repetir = "NO";
      print("Ha elegido la habitacion tipo SUITE");
      var a,b,e;
      print("Digite el numero de PERSONAS a hospedar:");
      a = stdin.readLineSync();
      personasSuite  = int.parse('$a');
      print("Digite el numero de NOCHES a hospedar:");
      b = stdin.readLineSync();
      nochesSuite = int.parse('$b');
      int repeat1;
      do {
        repeat1 = 0;
        print("¿Deseas reservar tambien habitaciones de tipo JUNIOR?  SI / NO ");
        e = stdin.readLineSync();
        if (e == "SI"){
          var f,g;
          print("Reserva para habitaciones tipo JUNIOR");
          print("Digite el numero de PERSONAS a hospedar:");
          f = stdin.readLineSync();
          personasJunior  = int.parse('$f');
          print("Digite el numero de NOCHES a hospedar:");
          g = stdin.readLineSync();
          nochesJunior = int.parse('$g');
      } else if (e == "NO"){
          print("Vale, no hay problema, continuemos");
      } else {
          print("Respuesta no válida");
          repeat1 = 1;
      }
      } while (repeat1 == 1);
      
    } 
    else if (habitacionElegida == "JUNIOR"){
      repetir = "NO";
      print("Ha elegido la habitacion tipo JUNIOR");
      var c,d;
      print("Digite el numero de PERSONAS a hospedar:");
      c = stdin.readLineSync();
      personasJunior  = int.parse('$c');
      print("Digite el numero de NOCHES a hospedar:");
      d = stdin.readLineSync();
      nochesJunior = int.parse('$d');

      int repeat2;
      do {
        repeat2 = 0;
        var h;
        print("¿Deseas reservar tambien habitaciones de tipo SUITE?  SI / NO ");
        h = stdin.readLineSync();
        if (h == "SI"){
          var i,j;
          print("Reserva para habitaciones tipo SUITE");
          print("Digite el numero de PERSONAS a hospedar:");
          i = stdin.readLineSync();
          personasSuite  = int.parse('$i');
          print("Digite el numero de NOCHES a hospedar:");
          j = stdin.readLineSync();
          nochesSuite = int.parse('$j');
      } else if (h == "NO"){
          print("Vale, no hay problema, continuemos");
      } else {
          print("Respuesta no válida");
          repeat2 = 1;
      }
      } while (repeat2 == 1);
    }
    else {
      repetir = "YES";
      print("Entrada incorrecta, digite de nuevo SUITE o JUNIOR segun su eleccion");
    }
  } while (repetir == "YES");


  //A partir de aqui se hacen los calculos correspondientes
  if (nochesSuite > 3){
    nochesSuiteAdicionales = nochesSuite - 3;
    precioSuiteNormal = 3 * 1500;
    precioSuiteNochesAdicionales = (nochesSuiteAdicionales*1500)-((nochesSuiteAdicionales*1500)*0.10);
    precioSuiteUnitario = precioSuiteNormal + precioSuiteNochesAdicionales;
    precioSuiteTotal = precioSuiteUnitario * personasSuite;
  } else {
    precioSuiteNormal = nochesSuite * 1500;
    precioSuiteUnitario = precioSuiteNormal;
    precioSuiteTotal = precioSuiteUnitario * personasSuite;
  }

  if (nochesJunior > 5){
    nochesJuniorAdicionales = nochesJunior - 5;
    precioJuniorNormal = 5 * 1000;
    precioJuniorNochesAdicionales = (nochesJuniorAdicionales*1000)-((nochesJuniorAdicionales*1000)*0.15);
    precioJuniorUnitario = precioJuniorNormal + precioJuniorNochesAdicionales;
    precioJuniorTotal = precioJuniorUnitario * personasJunior;
  } else {
    precioJuniorNormal = nochesJunior * 1000;
    precioJuniorUnitario = precioSuiteNormal;
    precioJuniorTotal = precioJuniorUnitario * personasJunior;
  }

  //Sacamos el subtotal de las 2 habitaciones
  precioSubtotalHabitaciones = precioSuiteTotal + precioJuniorTotal;
  
  //Preguntamos al usuario si tiene descuentos
  String? tarjeta, errorTarjeta;
  do {
    errorTarjeta = "NO";
    print("¿Cuenta con tarjeta del hotel? Escriba la que tenga: PLATINUM / ORO / NO");
    tarjeta = stdin.readLineSync();
    if (tarjeta == "PLATINUM"){
      print("Por su tarjeta ha obtenido el 20% de descuento en su total");
      descuentoPorTarjeta = precioSubtotalHabitaciones * 0.20;
    } else if (tarjeta == "ORO"){
      print("Por su tarjeta ha obtenido el 10% de descuento en su total");
      descuentoPorTarjeta = precioSubtotalHabitaciones * 0.10;
    } else if (tarjeta == "NO"){
      print("No tiene tarjeta, no podemos hacerle descuento");
      descuentoPorTarjeta = 0;
    } else {
      print("Respuesta no válida");
      errorTarjeta = "SI";
    }
  } while (errorTarjeta == "SI");

  //Sacando los totales finales
  totalFinal = precioSubtotalHabitaciones - descuentoPorTarjeta;

  //Mostrando el ticket
  print("Noches reservadas en habitaciones SUITE: $nochesSuite");
  print("Personas reservadas en habitaciones SUITE: $personasSuite");
  print("Precio normal de habitaciones SUITE no mayor a 3 noches: $precioSuiteNormal pesos");
  print("Precio especial de habitaciones SUITE mayor a 3 noches: $precioSuiteNochesAdicionales pesos");
  print("Precio total de las habitaciones SUITE: $precioSuiteTotal pesos");

  print("Noches reservadas en habitaciones JUNIOR: $nochesJunior");
  print("Personas reservadas en habitaciones JUNIOR: $personasJunior");
  print("Precio normal de habitaciones JUNIOR no mayor a 5 noches: $precioJuniorNormal pesos");
  print("Precio especial de habitaciones JUNIOR mayor a 5 noches: $precioJuniorNochesAdicionales pesos");
  print("Precio total de las habitaciones JUNIOR: $precioJuniorTotal pesos");

  print("Descuento por la tarjeta del hotel: $descuentoPorTarjeta");
  print("Total final a pagar: $totalFinal");
}

/*ESTUVO CHIDO ESTE CODIGO, ME SECÓ EL CEREBRO :)
⣿⣿⡿⠟⠛⠛⣿⠛⠛⠛⠛⢻⠛⠛⠛⢻⡟⠛⣿⣿⠛⢻⣿⣿⣿⣿⣿⣿
⣿⣿⡇⠐⠿⣿⣿⣿⡇⢸⣿⣿⠄⢸⣿⣿⡇⠄⣿⣿⠄⢸⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣶⣤⠈⣿⣿⡇⢸⣿⣿⠄⢰⣶⣾⡇⠄⣿⣿⠄⢸⣿⣿⣿⣿⣿⣿
⣿⣿⣇⣉⣁⣤⣿⣿⣇⣸⣿⣿⣀⣸⣿⣿⣿⣤⣈⣁⣤⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⡿⢿⣿⡿⠿⣿⡿⢿⡿⠿⠿⠿⣿⡿⠿⠿⠿⣿⠿⠿⠿⠿⣿⣿⠿⠟⠿⣿
⡇⠈⣿⠄⠄⣿⠃⣸⡇⠄⣶⣶⣿⡇⢰⣶⣶⣿⠄⢸⡷⠄⣿⡇⠰⢿⣶⣿
⣿⠄⠋⢰⡆⠸⠄⣿⡇⠄⣤⣤⣿⡇⢠⣤⣤⣿⠄⢰⣤⠈⢻⣿⣦⣄⠈⢿
⣿⣇⣀⣾⣷⣀⣸⣿⣇⣀⣉⣉⣹⣇⣈⣉⣉⣿⣀⣈⣉⣠⣾⣋⣉⣉⣠⣿
*/