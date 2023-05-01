import 'package:flutter/material.dart';
import 'package:shapp/screens/orders_screen.dart';
import 'package:shapp/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Every One'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
           ListTile(
            leading: const Icon(
              Icons.shop
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
             title: const Text("Shop"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
                Icons.payment
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routName);
            },
            title: const Text("Orders"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
                Icons.edit
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routName);
            },
            title: const Text("Manage Products"),
          )
        ],
      ),
    );
  }
}
