import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/screens/orders_screen.dart';
import '../providers/orders.dart';
import '../screens/cart_screen.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green
            )
                .copyWith(secondary: Colors.amber),
          ),
          home: const ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CartScreen.routName:(ctx)=>const CartScreen(),
            OrdersScreen.routName:(ctx)=>const OrdersScreen()
          }),
    );
  }
}
