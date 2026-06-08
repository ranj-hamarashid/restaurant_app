import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ١. پێویستە ئەم لایبرەرییە لێرەش هاوردە بکرێت
import 'package:restaurant_app/componets/button.dart';
import 'package:restaurant_app/componets/food_tile.dart';
import 'package:restaurant_app/models/shop.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'foodDetailspage.dart';

class Menu_page extends StatefulWidget {
  const Menu_page({super.key});

  @override
  State<Menu_page> createState() => _Menu_pageState();
}

class _Menu_pageState extends State<Menu_page> {
  // فەنکشنی چوونە ناو پەڕەی زانیارییەکان
  void navigateToDetailsPage(int index) {
    // ڕاستکردنەوەی پیتی context و بەکارهێنانی ئۆبجێکتی shop
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => foodDetailspage(food: foodMenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ٢. لێرەدا لیستەکە لە پرۆڤایدەرەوە دەخوێنینەوە بۆ ئەوەی لە هەموو شوێنێکی خوارەوە بەردەست بێت
    final shop = context.watch<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        elevation: 0,
        foregroundColor: Colors.grey[800],
        title: Text(
          "Kurdistan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "english",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cartpage");
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Get %20 promo",
                      style: TextStyle(
                        fontFamily: "english",
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyButton(text: 'reddem', onTap: () {}),
                  ],
                ),
                Image.asset("Assets/img/A1.png", height: 100),
              ],
            ),
          ),
          const SizedBox(height: 25),

          //search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here",
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              ),
            ),
          ),
          const SizedBox(height: 25),

          //menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontFamily: "english",
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length, // ئێستا ئەمە بێ کێشە کاردەکات
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToDetailsPage(index),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("Assets/img/A.png", height: 60),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Brnj w shla', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 10),
                        Text(
                          '\$21',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.favorite_outline, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
