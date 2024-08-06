
import 'package:crud/data/models/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  String url = "http://127.0.0.1:3000/api/v1/products";


//obtener todos los productos
Future<void> getData() async {
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
  } else {
    print("Failed to load data");
  }
}

  //agregar un producto
Future<int> addData(Product newProduct) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type' : 'application/json',
    },
    body: jsonEncode(newProduct.toJson())
  );
  print(response.statusCode);
  return response.statusCode;
}

//editar un producto
Future<void> editData(int? id, Product updateData) async {
  final response = await http.put(
    Uri.parse('$url/$id'),
  headers: <String, String>{
    'Content-Type' : 'application/json',
  },
  body: jsonEncode(updateData.toJson()),
  );
  print(response.statusCode);
}


//eliminar un producto
Future<void> deleteData(int? id) async {
  final response = await http.delete(
    Uri.parse('$url/$id'),
  headers: <String, String>{
    'Content-Type' : 'application/json',
  });
  print(response.statusCode);
}






