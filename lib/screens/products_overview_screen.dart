import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/screens/cart_screen.dart';
import 'package:shapp/widgets/app_drawer.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
                  const PopupMenuItem(
                    value: FilterOptions.Favorites,
                    child: Text('Only Favorites'),
                  ),
                  const PopupMenuItem(
                    value: FilterOptions.All,
                    child: Text('Show All'),
                  ),
                ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badges(
                  value: cart.itemCount.toString(),
                 color: Colors.red,
                  child: ch,
                ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    CartScreen.routName
                );
              },
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
