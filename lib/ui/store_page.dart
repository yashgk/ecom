import 'dart:async';
import 'dart:convert';

import 'package:ecom/core/constants/app_colors.dart';
import 'package:ecom/core/model/product_model.dart';
import 'package:ecom/ui/commonWids/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Product> allproducts = [];
  List<Product> favouriteProds = [];
  bool isLoading = false;

  Future getAllProducts() async {
    setState(() {
      isLoading = true;
    });

    final String data = await rootBundle.loadString('lib/products.json');
    final res = jsonDecode(data);
    var productJson = res["products"] as List;
    for (final product in productJson) {
      allproducts.add(Product.fromJson(product));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      padding: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: AppColors.darkSlateGreyColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.71,
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: List.generate(allproducts.length, (index) {
                return ProductTile(
                  product: allproducts[index],
                  update: () {
                    setState(() {});
                  },
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
