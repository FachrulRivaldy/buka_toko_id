import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bukatokoid/models/product_model.dart';
import 'package:bukatokoid/utils/constants.dart';

class ProductService {
  Future<List<Product>> fetchTopProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products?limit=4'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> productList =
          data.map((json) => Product.fromJson(json)).toList();
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Product> productList =
          data.map((json) => Product.fromJson(json)).toList();
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
