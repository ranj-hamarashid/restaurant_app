import 'package:flutter/material.dart';
import 'package:restaurant_app/componets/button.dart';

class Intro_page extends StatelessWidget {
  const Intro_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: SafeArea(
        // Ensures content stays away from device notches/status bars
        child: SingleChildScrollView(
          // Prevents viewport crashes if the screen is small
          child: Padding(
            padding: const EdgeInsets.all(25.0), // Kept one padding layer
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "RANJOI SUSHI",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "english",
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: Image.asset(
                    "Assets/img/A.png",
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "xoshtrin xwardni kurdawari tami rastaqina",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "english",
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  "sushi xwardni kurdawari tami rastaqina xoshtrin xwardni kurdawari tami rastaqina",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontFamily: "english",
                  ),
                ),

                const SizedBox(height: 40),

                Center(child: MyButton(text: "Get Started",onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
