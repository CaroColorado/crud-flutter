import 'package:crud/data/models/Product.dart';
import 'package:crud/data/source/product_controller.dart';
import 'package:crud/ui/footer.dart';
import 'package:flutter/material.dart';

class Productspage extends StatefulWidget {
  const Productspage({super.key});

  @override
  State<Productspage> createState() => _ProductspageState();
}

class _ProductspageState extends State<Productspage> {
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(12.0),
                child: FutureBuilder<List<Product>>(
                  future: getData(), // Obtiene los datos aquí
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('No hay productos disponibles.'));
                    } else {
                      final products = snapshot.data!;
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(product.name),
                              subtitle: Text(
                                  '${product.price} - ${product.description}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        deleteData(product.id);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
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
