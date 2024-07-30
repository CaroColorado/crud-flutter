
import 'package:flutter/material.dart';


class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar"
          ),
         BottomNavigationBarItem(
          icon: Icon(Icons.save),
          label: "Guardados"
          ) 
      ]
      );
  }
  
}