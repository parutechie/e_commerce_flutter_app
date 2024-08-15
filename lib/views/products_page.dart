import 'package:flutter/material.dart';
import 'package:infinity/providers/auth_provider.dart';
import 'package:infinity/views/login_page.dart';
import 'package:provider/provider.dart';
import 'package:infinity/controllers/remote_config_controller.dart';
import 'package:infinity/providers/product_provider.dart';
import 'package:infinity/widgets/product_item_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool? displayDiscountedPrice;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _loadRemoteConfig();
  }

  Future<void> _loadProducts() async {
    await Provider.of<ProductProvider>(context, listen: false).loadProducts();
  }

  Future<void> _loadRemoteConfig() async {
    RemoteConfigController remoteConfigController = RemoteConfigController();
    displayDiscountedPrice =
        await remoteConfigController.shouldDisplayDiscountedPrice();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        surfaceTintColor: Colors.grey,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Products',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () async {
                await Provider.of<AuthProvider>(context, listen: false)
                    .signOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Icon(
                Icons.logout,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              return ProductItemWidget(
                product: productProvider.products[index],
                displayDiscountedPrice: displayDiscountedPrice!,
              );
            },
          );
        },
      ),
    );
  }
}
