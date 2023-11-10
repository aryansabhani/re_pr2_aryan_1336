import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("Item Page"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(149, 171, 71, 1),
      ),
      body: Column(
        children: [
          Image.network(
            data['thumbnail'],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Text(
                "Name : ${data['title']}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "description : ${data['description']}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              )
            ]),
          )
        ],
      ),
    );
  }
}
