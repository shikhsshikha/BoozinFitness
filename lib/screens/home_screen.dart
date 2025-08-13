import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            ProgressCard(
              title: "Steps",
              value: 13112,
              goal: 15000,
              icon: Icons.directions_run,
              unit: "",
              isDarkMode: isDarkMode,
            ),
            SizedBox(height: 30),
            ProgressCard(
              title: "Calories Burned",
              value: 500,
              goal: 1000,
              icon: Icons.local_fire_department,
              unit: "KCAL",
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final String title;
  final int value;
  final int goal;
  final IconData icon;
  final String unit;
  final bool isDarkMode;

  const ProgressCard({
    super.key,
    required this.title,
    required this.value,
    required this.goal,
    required this.icon,
    required this.unit,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    double progress = value / goal;

    Color backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.grey.shade200;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color progressColor = isDarkMode ? Colors.white : Colors.black;
    Color progressBackground = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: textColor),
                    children: [
                      TextSpan(text: "$title: "),
                      TextSpan(
                          text: "$value",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      if (unit.isNotEmpty) TextSpan(text: " $unit"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 20,
                    backgroundColor: progressBackground,
                    color: progressColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("0",
                        style: TextStyle(fontSize: 12, color: textColor.withOpacity(0.6))),
                    Text("Goal: $goal",
                        style: TextStyle(fontSize: 12, color: textColor.withOpacity(0.6))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 50, color: textColor),
          ),
        ],
      ),
    );
  }
}
