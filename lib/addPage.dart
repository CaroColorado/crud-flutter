import 'package:flutter/material.dart';

class addPage extends StatelessWidget {
  const addPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          input(),
          input(),
          input()
        ],),
    );
  }
}

Widget input() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 40.0,
          width: constraints.maxWidth, // ajuste de ancho responsivo
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter',
              hintStyle: TextStyle(color: Color.fromARGB(255, 85, 88, 92)),
              filled: true,
              fillColor: Color.fromARGB(255, 236, 227, 222),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Color.fromARGB(255, 231, 198, 179)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            style: TextStyle(color: const Color.fromARGB(255, 37, 39, 41)),
          ),
        );
      },
    ),
  );
}

  