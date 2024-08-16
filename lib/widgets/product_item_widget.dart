import 'package:flutter/cupertino.dart';
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
    // double displayedPrice = displayDiscountedPrice
    //     ? product.price * (1 - product.discountPercentage / 100)
    //     : product.price;

    double discountedPrice =
        product.price * (1 - product.discountPercentage / 100);

    return Container(
      height: 500,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.imageUrl,
                    width: 200,
                  ),
                ),
                // Title and Description
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
                // Price and Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    displayDiscountedPrice
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '-${product.discountPercentage.toString()}%',
                                    style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '\$${discountedPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'M.R.P.:',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                    // Button
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //rating
          if (displayDiscountedPrice)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.rating!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Color.fromARGB(255, 255, 204, 0),
                      size: 20,
                    )
                  ],
                ),
              ),
            ),

          // Container(
          //   height: 60,
          //   width: 140,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.circular(50),
          //   ),
          //   child: Center(
          //     child: Text(
          //       '\$${displayedPrice.toStringAsFixed(2)}',
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // )
        ],
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


// Positioned widget for top-right text
      
