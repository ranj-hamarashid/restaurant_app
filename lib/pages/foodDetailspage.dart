import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/componets/button.dart'; // Note: check if spelled 'components' in your folder
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/models/shop.dart';
import 'package:restaurant_app/theme/colors.dart';

// Best practice: Class names should be CamelCase (FoodDetailsPage)
class foodDetailspage extends StatefulWidget {
  final Food food;
  const foodDetailspage({super.key, required this.food});

  @override
  State<foodDetailspage> createState() => _foodDetailspageState();
}

class _foodDetailspageState extends State<foodDetailspage> {
  int quantity = 0;

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void addToCart() {
    if (quantity > 0) {
      // Accessing the Shop provider without listening to changes
      final shop = context.read<Shop>();

      // Adding items to the cart
      shop.addToCart(widget.food, quantity);

      // Showing the success dialog
      showDialog(
        context: context,
        barrierDismissible:
            false, // Fixed the misplaced closing parenthesis here
        builder: (context) => AlertDialog(
          backgroundColor: primarycolor,
          title: const Text('Success', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Added to cart successfully!',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
                // Go back to the previous screen (Menu/Home)
                Navigator.pop(context);
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.name)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(widget.food.imagepath, height: 200),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[900]),
                      const SizedBox(width: 10),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "english",
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Description", // Fixed typo "descroption"
                    style: TextStyle(color: Colors.grey[900], fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "The food is very delicious and it is one of the best foods in the world. It is very popular, tasty, healthy, and exceptionally good for your overall well-being.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: primarycolor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Modernized string interpolation
                      Text(
                        '\$${widget.food.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: secondarycolor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                              onPressed: decrementQuantity,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: secondarycolor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  MyButton(text: 'Add to Cart', onTap: addToCart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
