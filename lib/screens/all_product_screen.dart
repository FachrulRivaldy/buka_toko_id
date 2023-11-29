import 'package:bukatokoid/core/widgets.dart';
import 'package:bukatokoid/models/product_model.dart';
import 'package:bukatokoid/services/product_service.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late Future<List<Product>> products;
  @override
  void initState() {
    products = ProductService().fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String? img = snapshot.data![index].image;
                String? title = snapshot.data![index].title;
                String? price = snapshot.data![index].price.toString();
                return ProductCard(imageUrl: img, title: title, price: price);
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
