import 'package:flutter/material.dart';
import '../../widgets/styles.dart';
import '../../widgets/modals/success_modal.dart';

class InfoProfile extends StatefulWidget {
  const InfoProfile({super.key});

  @override
  State<InfoProfile> createState() => _InfoProfileState();
}

class _InfoProfileState extends State<InfoProfile> {
  String? selectedValue; // Valor seleccionado
  List<String> items = ["+54", "+55", "+54", "+1", "+34"];
  List<String> itemsSexo = ["Opcion 1", "Opcion 2", "Opcion 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: double.infinity, // Toma todo el ancho disponible
              child: Image.asset(
                'assets/fondo.png',
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16, left: 16),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      style: Styles.btnIconBack,
                      icon: Icon(Icons.keyboard_arrow_left),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 35),
                  Center(
                    child: Text(
                      'Completa tu perfil',
                      style: Styles.headline,
                    ),
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                    width: 400,
                    child: Center(
                      child: Text(
                        "No te preocupes, solo tú pordrás ver tus datos personales. Nadie más lo verá.",
                        style: Styles.textMuted,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  //* Nombre
                  Container(
                    width:
                        double.infinity, // Hace que ocupe todo el ancho posible
                    alignment: Alignment.centerLeft, // Alinea a la derecha
                    child: Text(
                      "Nombre",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      style: Styles.textField,
                      decoration: Styles.inputDecoration.copyWith(
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (text) {
                        print("Password: $text");
                      },
                    ),
                  ),
                  SizedBox(height: 25),

                  //* Input Numero de Telefono
                  Container(
                    width:
                        double.infinity, // Hace que ocupe todo el ancho posible
                    alignment: Alignment.centerLeft, // Alinea a la derecha
                    child: Text(
                      "Número de teléfono",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 243, 247),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text("+54"),
                              value: selectedValue,
                              items: items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              style: Styles.textField,
                              decoration: Styles.inputDecoration.copyWith(
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              onChanged: (text) {
                                print("Password: $text");
                              },
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 25),

                  //* Input Sexo
                  Container(
                    width:
                        double.infinity, // Hace que ocupe todo el ancho posible
                    alignment: Alignment.centerLeft, // Alinea a la derecha
                    child: Text(
                      "Sexo",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 242, 243, 247),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text("+54"),
                            value: selectedValue,
                            items: itemsSexo.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Future.delayed(Duration.zero, () {
                          showDialog(
                            context: context,
                            barrierDismissible:
                                false, // Evita que se cierre tocando fuera del modal
                            builder: (BuildContext context) {
                              return SuccessModal(
                                onConfirm: () {
                                  Navigator.pop(context); // Cierra el modal
                                  Navigator.pushNamed(context,
                                      '/code_verify'); // Redirige a otra pantalla
                                },
                              );
                            },
                          );
                        });
                      },
                      style: Styles.btn,
                      child: const Text(
                        'COMPLETAR PERFIL',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
