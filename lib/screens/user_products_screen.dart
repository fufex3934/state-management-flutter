import 'package:flutter/material.dart';
import 'package:shapp/widgets/app_drawer.dart';
import 'package:shapp/widgets/edit_product_screen.dart';
import 'package:shapp/widgets/user_product_item.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
class UserProductsScreen extends StatelessWidget {
  static const routName = "user/products";
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    EditProductScreen.routName
                );
              },
              icon: const Icon(
                Icons.add
              )
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemBuilder: (context,index){
              return Column(
                children: [
                  UserProductItem(
                    productsData.items[index].title,
                    productsData.items[index].imageUrl
                  ),
                  const Divider()
                ],
              );
            },
          itemCount: productsData.items.length,
        ),
        
      ),
    );
  }
}
