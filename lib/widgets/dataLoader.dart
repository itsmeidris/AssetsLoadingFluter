import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loading_assets/models/shoeProduct.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:loading_assets/widgets/product_card.dart';

class Dataloader extends StatefulWidget {
  const Dataloader({super.key});

  @override
  DataloaderState createState() => DataloaderState();
}

class DataloaderState extends State<Dataloader> {
  @override
  void initState() {
    super.initState();
    _loadProductsData();
  }

  //The next step is to implement the loadVirtualProductData() function 
  //to load the data from the virtual_products.json file.
  Future<List<Shoeproduct>> _loadProductsData() async {

    //Load the JSON data from the 'prodcucts.json' file
    String productsDataUrl = await rootBundle.loadString('assets/data/products.json');

    //Convert the JSON data to a list of Maps, where each Map represents a product
    final productsData = jsonDecode(productsDataUrl) as List<dynamic>;

    //Create a list of ProductData instances from the Maps, and return the list.
    return productsData
        .map((product) => Shoeproduct.fromJson(product))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadProductsData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Shoeproduct> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final product = data[index];
                return ProductCard(
                    productName: product.name,
                    productDescription: product.description,
                    productPrice: product.price,
                    productImage: product.image);
              },
            );
          } 
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } 
          else {
            return const CircularProgressIndicator();
          }
        });
  }
}

//FutureBuilder widget that builds itself based on the latest snapshot of
//interaction with a Future. 
//It is used to display a widget tree that 
//asynchronously "fills in" when a Future completes.

//hasData: Indicates whether the Future has completed successfully 
//and has data available.

//hasError: Indicates whether the Future has completed with an error.

//The FutureBuilder is a powerful widget that allows you to easily 
//integrate asynchronous operations into your UI, and it is commonly used
//when fetching data from an API or performing other long-running operations.

