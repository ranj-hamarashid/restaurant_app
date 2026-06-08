import 'package:flutter/material.dart';
import 'package:restaurant_app/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // دیاریکردنی پانی جێگیر بۆ کانتینەرەکە بۆ ئەوەی لە ناو ListView.builder بە ئاسانی ڕێکببێت
        width: 200, 
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25, bottom: 10, top: 10),
        padding: const EdgeInsets.all(20), // کەمکردنەوەی پادینگ بۆ ڕێگری لە overflow لەسەر شاشەی بچووک
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // گۆڕینی بۆ نێوانبڕی ڕێکخراو
          children: [
            // ١. وێنەی خواردنەکە (پێچانەوە لە ناو Center و Flexible بۆ پاراستنی قەبارە)
            Expanded(
              child: Center(
                child: Image.asset(
                  food.imagepath,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ٢. ناوی خواردنەکە (پارێزراو بە ellipsis ئەگەر ناوەکە زۆر درێژ بوو)
            Text(
              food.name,
              style: const TextStyle(
                fontFamily: "english", 
                fontSize: 20, // کەمێک کەمکراوەتەوە بۆ سەر شاشەی مۆبایل
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 10),

            // ٣. بەشی نرخ و ڕەیتینگ (لابردنی SizedBoxـە ڕەقەکە و بەکارهێنانی Rowی ئازاد)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // نرخەکە
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),

                // ڕەیتینگ
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[800], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      food.rating,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}