import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap; // گۆڕینی بۆ void Function() کە ستانداردترە

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap, // باشترە لێرەدا required بێت بۆ ئەوەی هەمیشە کلیک بکات
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // وێنەی خواردنەکە
            Image.asset(food.imagepath, height: 140),

            // ناوی خواردنەکە
            Text(
              food.name,
              style: const TextStyle(fontFamily: "english", fontSize: 24),
            ),

            // بەشی نرخ و ڕەیتینگ
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // بەکارهێنانی String Interpolation لە جیاتی نیشانەی (+)
                  Text('\$${food.price}'),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700], size: 16),
                      const SizedBox(
                        width: 4,
                      ), // کەمێک بۆشایی لە نێوان ئەستێرەکە و ژمارەکە
                      Text(
                        food.rating,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
