import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food.dart';

// ١. زیادکردنی 'with ChangeNotifier' بۆ ئەوەی ببێتە پرۆڤایدەر
class Shop with ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "brnj w shla",
      price: "21",
      imagepath: "Assets/img/AAA.png",
      rating: "4.9",
    ),
    Food(
      name: "qozi",
      price: "999",
      imagepath: "Assets/img/AA.png",
      rating: "5.0",
    ),
    Food(
      name: "qozi",
      price: "999",
      imagepath: "Assets/img/AA.png",
      rating: "5.0",
    ),
  ];

  // سەبەتەی کڕینی کڕیار (ناویم ناوە cart چونکە باوترە لە card)
  final List<Food> _cart = [];

  // Getter هێنەرەکان
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // فەنکشنی زیادکردن بۆ ناو سەبەتە
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    // ٢. ئاگادارکردنەوەی ویدجێتەکان کە داتاکە گۆڕاوە
    notifyListeners();
  }

  // فەنکشنی سڕینەوە لە سەبەتە (ئەمە پێشتر لەناو فەنکشنەکەی سەرەوەدا بوو، جیامان کردەوە)
  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    // ٣. ئاگادارکردنەوەی ویدجێتەکان
    notifyListeners();
  }
}