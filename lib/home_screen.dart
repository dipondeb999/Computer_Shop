import 'package:computer_shop/items_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  MySnackBar(message, context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
            'Computer Shop',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              MySnackBar('I am a Search', context);
            },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
          ),
          IconButton(
            onPressed: () {
              MySnackBar('I am a More Option', context);
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: ListView.builder(
        itemCount: ItemsList.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              MySnackBar("Name : ${ItemsList[index]['name']}                Price : ${ItemsList[index]['price']}", context);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              height: 250,
              width: double.infinity,
              child: Image.network(ItemsList[index]['img'] ?? '',
              fit: BoxFit.cover,
              ),
            ),
          );
        }
      ),
    );
  }
}
