//import 'package:fitmeals/UI/settings/settings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "Home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9f6ee),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(() {
              //  Navigator.pushNamed(context, SettingsScreen.routeName);
              }),

              const SizedBox(height: 15),

              const Text(
                "Welcome Back, Alex!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              const Text(
                "Today's Suggestions:",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 25),

              /// Meal cards
              _mealCard(
                title: "Breakfast",
                imageUrl: "assets/images/breakfast.jpg",
              ),

              const SizedBox(height: 20),

              _mealCard(title: "Lunch", imageUrl: "assets/images/lunch.jpeg"),

              const SizedBox(height: 20),

              _mealCard(title: "Dinner", imageUrl: "assets/images/dinner.jpg"),

              const SizedBox(height: 35),

              // Suggest another meal button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff52b56f),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Suggest Another meal",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ---------------------------
  /// TOP BAR (Logo + name + icons)
  /// ---------------------------
  Widget _topBar(GestureTapCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo + Title
        Row(
          children: [
            const Icon(Icons.local_florist, size: 28, color: Color(0xff52b56f)),
            const SizedBox(width: 6),
            const Text(
              "FitMeals",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),

        // Profile picture + settings
        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
            ),
            const SizedBox(width: 12),
            InkWell(onTap: onTap, child: const Icon(Icons.settings, size: 26)),
          ],
        ),
      ],
    );
  }

  /// ---------------------------
  ///  Meal Card Widget
  /// ---------------------------
  Widget _mealCard({required String title, required String imageUrl}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // meal image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              width: 110,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          // Text + button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff52b56f),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "View Recipe",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}