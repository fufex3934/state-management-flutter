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
      confirmDismiss: (direction){
        return showDialog(
            context: context,
            builder: (context){
              return  AlertDialog(
                title: const Text("Are you Sure"),
                content: const Text('Do you want to remove item from the cart?'),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pop(false);
                      },
                      child: const Text("No")
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.of(context).pop(true);
                      },
                      child: const Text("Yes")
                  ),
                ],
              );
            }
        );
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
