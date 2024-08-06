import 'package:crud/data/models/Product.dart';
import 'package:crud/ui/footer.dart';
import 'package:flutter/material.dart';

class Productspage extends StatelessWidget {
  const Productspage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ejemplo de lista de productos
    final List<Product> products = [
      Product(name: 'Producto 1', price: 100, description: 'Descripción 1'),
      Product(name: 'Producto 2', price: 200, description: 'Descripción 2'),
      Product(name: 'Producto 2', price: 200, description: 'Descripción 2'),
      Product(name: 'Producto 2', price: 200, description: 'Descripción 2'),
      Product(name: 'Producto 2', price: 200, description: 'Descripción 2'),
      Product(name: 'Producto 2', price: 200, description: 'Descripción 2'),
      Product(name: 'Producto 2', price: 200, description: 'Descripción 2'),
      // Agrega más productos aquí
    ];

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: const Center(
              child: Text(
                'Productos agregados',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(product.name),
                          subtitle:
                              Text('${product.price} - ${product.description}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: footer(),
    );
  }
}
