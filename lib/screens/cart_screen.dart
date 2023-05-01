import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
import '../widgets/cart_item.dart' as CartItemWidget;


class CartScreen extends StatelessWidget {
  static const routName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children:  [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                   const Text(
                       'Total',
                     style: TextStyle(
                       fontSize: 20,
                     ),
                   ),
                  const Spacer(),
                  Chip(
                      label: Text(
                          "\$${cart.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).primaryTextTheme.titleMedium?.color
                        ),
                      ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                      onPressed: (){
                        Provider.of<Orders>(context,listen: false).addOrder(
                            cart.items.values.toList(),
                            cart.totalAmount
                        );
                        cart.clearCart();
                      },
                      child: const Text("ORDER NOW"),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context,index)=>CartItemWidget.CartItemWidget(
                      id: (cart.items.values.toList()[index]?.id) as String,
                      productId: cart.items.keys.toList()[index],
                      title: (cart.items.values.toList()[index]?.title)as String,
                      quantity: (cart.items.values.toList()[index]?.quantity)as int,
                      price:( cart.items.values.toList()[index]?.price)as double
                  ),
                itemCount: cart.items.length,
              ),
          )
        ],
      ),
    );
  }
}
