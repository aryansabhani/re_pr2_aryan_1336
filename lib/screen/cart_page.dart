import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_pr2_aryan_1336/provider/cartProvider.dart';

class CartPAge extends StatefulWidget {
  const CartPAge({super.key});

  @override
  State<CartPAge> createState() => _CartPAgeState();
}

class _CartPAgeState extends State<CartPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(149, 171, 71, 1),
      ),
      body: Consumer<CartProvider>(builder: (context, pro, child) {
        return ListView(
          padding: EdgeInsets.all(16),
          children: List.generate(pro.cartItems.length, (index) {
            return Card(
              child: ListTile(
                leading: Image.network(pro.cartItems[index]['thumbnail'],
                    height: 35, fit: BoxFit.fill),
                title: Text(pro.cartItems[index]['title']),
              ),
            );
          }),
        );
      }),
    );
  }
}
