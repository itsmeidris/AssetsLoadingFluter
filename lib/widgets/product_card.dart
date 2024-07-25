import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String? productImage;

  const ProductCard({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: productImage != null
          ? SizedBox(
              width: 100,
              height: double.infinity,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif', 
                image: productImage!
              ),    
            )
          : const SizedBox.shrink(),
      title: Text(
        productName,
        style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 29, 72, 106),
            fontSize: 22,
            fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        productDescription,
        style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 29, 72, 106),
            fontSize: 15,
            fontWeight: FontWeight.w400),
      ),
      trailing: Text(
        '${productPrice.toString()} \$',
        style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 29, 72, 106),
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    ));
  }
}
