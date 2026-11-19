import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

final apiUrl = dotenv.get('BASE_URL');

abstract class ProductService {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(String id);
  Future<void> createProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
}

class ProductServiceImpl implements ProductService {
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  @override
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$apiUrl/products'));

    if (response.statusCode == 200) {
      if (response.body.isEmpty) return [];
      final dynamic decoded = jsonDecode(response.body);
      final List<dynamic> jsonList = decoded is List
          ? decoded
          : (decoded['products'] as List<dynamic>? ?? []);

      return jsonList
          .map((json) => Product.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load products (${response.statusCode})');
    }
  }

  @override
  Future<void> createProduct(Product product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
