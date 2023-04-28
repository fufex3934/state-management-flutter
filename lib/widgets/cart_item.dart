import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final String title;
  final int quantity;

  const CartItemWidget({
    super.key,
    required this.id,
    required this.price,
    required this.title,
    required this.quantity,
    required this.productId
});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context,listen: false);
    return  Dismissible(
      key: Key(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
          cart.removeItem(productId);
      },
      background:Container(
        color: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("\$$price"),
                ),
            ),
          ),
          title: Text(title),
          subtitle: Text("Total: \$${(price * quantity)}"),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
