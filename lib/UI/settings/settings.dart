import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName ="Settings";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Dietary options
  String selectedDiet = "Vegan";

  // Toggles
  bool darkMode = false;
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe9f6ee),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),

              const SizedBox(height: 25),

              _profileSection(),

              const SizedBox(height: 25),

              const Text(
                "Dietary Preferences",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _dietOption("Vegan"),
              const SizedBox(height: 10),

              _dietOption("Keto"),
              const SizedBox(height: 10),

              _dietOption("Paleo"),
              const SizedBox(height: 10),

              _dietOption("Mediterramean"),

              const SizedBox(height: 30),

              const Text(
                "App Preferences",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _switchTile(
                title: "Dark Mode",
                value: darkMode,
                onChanged: (v) => setState(() => darkMode = v),
              ),

              const SizedBox(height: 10),

              _switchTile(
                title: "Notifications",
                value: notifications,
                onChanged: (v) => setState(() => notifications = v),
              ),

              const SizedBox(height: 40),

              _signOutButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// ---------------------------
  ///   HEADER
  /// ---------------------------
  Widget _header(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, size: 28),
        ),
        const Spacer(),
        Column(
          children: const [
            Text(
              "FitMeals",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Icon(Icons.local_florist, color: Color(0xff52b56f), size: 20),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  /// ---------------------------
  ///   PROFILE SECTION
  /// ---------------------------
  Widget _profileSection() {
    return Row(
      children: const [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
        ),
        SizedBox(width: 12),
        Text(
          "Alex",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  /// ---------------------------
  /// DIET OPTION ITEM
  /// ---------------------------
  Widget _dietOption(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: RadioListTile(
        activeColor: const Color(0xff52b56f),
        title: Text(label),
        value: label,
        groupValue: selectedDiet,
        onChanged: (value) {
          setState(() {
            selectedDiet = value.toString();
          });
        },
      ),
    );
  }

  /// ---------------------------
  /// SWITCH ITEM (Dark Mode, Notifications)
  /// ---------------------------
  Widget _switchTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SwitchListTile(
        activeColor: const Color(0xff52b56f),
        contentPadding: EdgeInsets.zero,
        title: Text(title),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  /// ---------------------------
  /// SIGN OUT BUTTON
  /// ---------------------------
  Widget _signOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff52b56f),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "Sign Out",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}