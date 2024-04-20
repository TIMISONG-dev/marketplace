import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marketplace/classes/product.dart';
import 'package:marketplace/components/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  static int ind = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.shop,
                ),
              ),
              const Text("Bariga"),
              GestureDetector(
                onTap: () { print("hello world"); },
                child: const Padding(
                  padding: EdgeInsets.only(left: 300),
                  child: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: GridView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                InkWell(
                  onTap: () {
                    ind = index * 3;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Product()),
                  ); },
                  child: Container(
                    width: 200,
                    height: 300,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFBDBDBD),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          strings[index].photo,
                          width: 100,
                          height: 100,
                        ),
                        Text(
                            strings[index].cost,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 24, color: Colors.lightGreen[400], fontWeight: FontWeight.bold)
                        ),
                        Text(
                          strings[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                            strings[index].shortdesc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12, color: Colors.grey)
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 0.6,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}