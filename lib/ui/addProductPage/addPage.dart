
import 'package:crud/data/models/Product.dart';
import 'package:crud/data/source/product_controller.dart';
import 'package:crud/ui/footer.dart';
import 'package:flutter/material.dart';

final TextEditingController _controllerName = TextEditingController();
final TextEditingController _controllerDescription = TextEditingController();
final TextEditingController _controllerPrice = TextEditingController();

class addPage extends StatelessWidget {
  const addPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Contenedor superior (30% de la pantalla)
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: const Center(
              child: Text(
                'Agregar Producto',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Contenedor inferior (70% de la pantalla)
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                        controller: _controllerName,
                        decoration: const InputDecoration(
                          labelText: "Nombre",
                          filled: true,
                          fillColor: Colors.white,
                        )),
                    const SizedBox(height: 16),
                    TextField(
                        controller: _controllerPrice,
                        decoration: const InputDecoration(
                          labelText: "Price",
                          filled: true,
                          fillColor: Colors.white,
                        )),
                    const SizedBox(height: 16),
                    TextField(
                        controller: _controllerDescription,
                        decoration: const InputDecoration(
                          labelText: "Description",
                          filled: true,
                          fillColor: Colors.white,
                        )),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        addProduct(context);
                      },
                      child: const Text('Agregar Producto'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const footer(),
    );
  }

  void showAlertDialog(BuildContext context, String titulo, String contenido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(contenido),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  addProduct(BuildContext context) async {
    Product newProduct = Product(
        name: _controllerName.value.text,
        description: _controllerDescription.value.text,
        price: double.parse(_controllerPrice.value.text));
    int statusCode = await addData(newProduct);
    if (statusCode == 200) {
      showAlertDialog(context, "Producto Agregado",
          "Producto se ha agregado correctamente");
      reiniciarTextFields();
    } else {
      showAlertDialog(context, "Error", "Producto no se agregó correctamente");
      reiniciarTextFields();
    }
  }
  reiniciarTextFields() {
    _controllerName.clear();
    _controllerPrice.clear();
    _controllerDescription.clear();
  }
}
