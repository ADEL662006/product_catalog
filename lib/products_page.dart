import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String username;

  const ProductsPage({
    super.key,
    required this.username,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int favorites = 0;
  double width = 0;
  String cartMessage = "";

  final List<Map<String, dynamic>> products = [
    {"name": "Laptop", "price": 1200},
    {"name": "Phone", "price": 800},
    {"name": "Headphones", "price": 150},
    {"name": "Watch", "price": 250},
    {"name": "Keyboard", "price": 90},
    {"name": "Mouse", "price": 40},
  ];

  @override
  void initState() {
    super.initState();
    debugPrint("ProductsPage: initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final size = MediaQuery.sizeOf(context);
    width = size.width;

    debugPrint(
      "ProductsPage: didChangeDependencies -> width: ${size.width}, height: ${size.height}",
    );
  }

  @override
  void deactivate() {
    debugPrint("ProductsPage: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("ProductsPage: dispose");
    super.dispose();
  }

  void addFavorite() {
    setState(() {
      favorites++;
    });
  }

  Future<void> openDetails(int index) async {
    final String name = products[index]["name"];
    final int price = products[index]["price"];

    final result = await context.push<String>(
      '/details',
      extra: {
        "name": name,
        "price": price,
      },
    );

    if (!mounted) return;

    if (result != null) {
      setState(() {
        cartMessage = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ProductsPage: build");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: const Color(0xFF3F51B5),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF3F51B5),
                  Color(0xFF9C27B0),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ${widget.username}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Favorites: $favorites",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),

          if (cartMessage.isNotEmpty)
            Container(
              width: double.infinity,
              color: Colors.green[100],
              padding: const EdgeInsets.all(12),
              child: Text(
                cartMessage,
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          Expanded(
            child: width < 600
                ? ProductsListView(
              products: products,
              onFavoritePressed: addFavorite,
              onProductTap: openDetails,
            )
                : ProductsGridView(
              products: products,
              onFavoritePressed: addFavorite,
              onProductTap: openDetails,
            ),
          ),
        ],
      ),
    );
  }
}
