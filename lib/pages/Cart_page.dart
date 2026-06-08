import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("My Cart"), backgroundColor: Colors.red),
      // بەکارهێنانی Consumer بۆ بەستنەوەی شاشەکە بە پرۆڤایدەری Shop
      body: Consumer<Shop>(
        builder: (context, shop, child) {
          // وەرگرتنی لیستی ئەو خواردنانەی لە سەبەتەدان
          final List<Food> userCart = shop.cart;

          // ئەگەر سەبەتەکە بەتاڵ بوو، ئەم دەقە نیشان بدە
          if (userCart.isEmpty) {
            return const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // ئەگەر خواردن لە سەبەتەکەدا هەبوو، لیستەکە دروست بکە
          return ListView.builder(
            itemCount: userCart.length,
            itemBuilder: (context, index) {
              // وەرگرتنی تاکە خواردنێک بەپێی ئیندێکسەکەی
              final Food foodItem = userCart[index];

              // گەڕاندنەوەی ListTile بۆ نیشاندانی زانیارییەکان
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  // وێنەی خواردنەکە
                  leading: Image.asset(foodItem.imagepath, height: 50),

                  // ناوی خواردنەکە
                  title: Text(
                    foodItem.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  // نرخی خواردنەکە
                  subtitle: Text("\$${foodItem.price}"),

                  // دوگمەیەک لە کۆتاییدا بۆ سڕینەوەی خواردنەکە لە سەبەتە
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // بانگکردنی فەنکشنی سڕینەوە لە پرۆڤایدەرەکە
                      shop.removeFromCart(foodItem);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
