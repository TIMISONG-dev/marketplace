
import 'package:flutter/material.dart';
import 'package:marketplace/components/strings.dart';
import 'package:marketplace/classes/home.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      home: const Product(),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {

    final int count = Home.ind;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Bariga"),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [count,1+count,2+count,].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Image.network(photos[i])
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                  child:                 Text(
                    strings[index].desc,
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}