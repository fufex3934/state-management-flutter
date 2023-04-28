import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../screens/order_item_widget.dart';

import '../providers/orders.dart';
class OrdersScreen extends StatelessWidget {
  static const routName = '/order-screen';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders!"),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemBuilder: (ctx,i){
            return OrderItemsWidget(ordersData.orders[i]);
          },
        itemCount: ordersData.orders.length,
      ),
    );
  }
}
