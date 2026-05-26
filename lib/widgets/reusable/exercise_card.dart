import 'package:flutter/material.dart';
import 'package:workout_planer/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  const ExerciseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kCardBackgroundColor,
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Image.asset(imageUrl, width: 100, fit: BoxFit.cover),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: kGradientTopColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
