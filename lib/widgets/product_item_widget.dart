import 'package:flutter/material.dart';
import 'package:infinity/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;
  final bool displayDiscountedPrice;

  const ProductItemWidget({
    super.key,
    required this.product,
    required this.displayDiscountedPrice,
  });

  @override
  Widget build(BuildContext context) {
    double displayedPrice = displayDiscountedPrice
        ? product.price * (1 - product.discountPercentage / 100)
        : product.price;

    return Container(
      height: 500,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              product.imageUrl,
              width: 200,
            ),

            //title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                //description
                Text(
                  product.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            //price
            Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  '\$${displayedPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// ListTile(
//         leading: Image.network(product.imageUrl),
//         title: Text(product.title),
//         subtitle: Text(product.description),
//         trailing: Text('\$${displayedPrice.toStringAsFixed(2)}'),
//       ),