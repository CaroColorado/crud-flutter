import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {

    onItemTapped(int index) {
      switch(index){
        case 0:
          return Navigator.pushNamed(context, "/add");
        case 1:
          return Navigator.pushNamed(context, "/products");  
        default:
        return Navigator.pushNamed(context, "/add");  
      }
    }

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Agregar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save),
          label: 'Guardados',
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
