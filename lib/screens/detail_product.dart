import 'package:forza_shop/models/product_entry.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({
    required this.productFields,
    super.key
  });

  final Fields productFields;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late Fields productFields;

  @override
  void initState() {
    productFields = widget.productFields;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                productFields.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text("Price: ${productFields.price}"),
              const SizedBox(height: 10),
              Text("Description: ${productFields.description}"),
            ],
          ),
        ),
      ),
    );
  }
}