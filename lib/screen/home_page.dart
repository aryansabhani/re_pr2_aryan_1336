import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:re_pr2_aryan_1336/helper/databaseHelper.dart';
import 'package:re_pr2_aryan_1336/provider/cartProvider.dart';
import 'package:re_pr2_aryan_1336/provider/home_provider.dart';
import 'package:re_pr2_aryan_1336/utils/myroutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    // GoogleSignInAccount user =
    //     ModalRoute.of(context)!.settings.arguments as GoogleSignInAccount;

    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(149, 171, 71, 1),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      MyRoutes.CartPage,
                    );
                  },
                  icon: Icon(Icons.shopping_cart)),
              Align(
                alignment: Alignment.topCenter,
                child: Text(Provider.of<CartProvider>(context)
                    .cartItems
                    .length
                    .toString()),
              ),
            ],
          )
        ],
      ),
      // drawer: Drawer(
      //   // backgroundColor
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Container(
      //         padding: EdgeInsets.all(30),
      //         color: Color.fromRGBO(149, 171, 71, 1),
      //         child: ListTile(
      //           title: Text(user?.displayName ?? "user",
      //               style: TextStyle(fontSize: 14)),
      //           subtitle: Text(user?.email ?? "xyz@gmail.com",
      //               style: TextStyle(fontSize: 12)),
      //           leading: CircleAvatar(
      //             radius: 30,
      //             backgroundImage: NetworkImage(user?.photoUrl ??
      //                 "https://img.freepik.com/premium-vector/account-icon-user-icon-vector-graphics_292645-552.jpg"),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Consumer<ApiProvider>(builder: (context, pro, _) {
        // return ListView(
        //   children: List.generate(pro.alldata.length, (index) {
        //     return Card(
        //       child: Column(
        //         children: [
        //           Image.network(pro.alldata[index]['thumbnail']),
        //         ],
        //       ),
        //     );
        //   }),
        // );
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 3),
          padding: EdgeInsets.all(16),
          itemCount: pro.alldata.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MyRoutes.itemPage,
                    arguments: pro.alldata[index]);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.network(pro.alldata[index]['thumbnail'],
                              height: 200)),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "${pro.alldata[index]['title']}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "brand: ${pro.alldata[index]['brand']}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "rating: ${pro.alldata[index]['rating']}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "stock: ${pro.alldata[index]['stock']}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "${pro.alldata[index]['price']}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .addCartItem(
                                              cartItem: pro.alldata[index]);
                                    },
                                    icon: Icon(Icons.add_shopping_cart))
                              ],
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
