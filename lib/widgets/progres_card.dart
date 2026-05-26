import 'package:flutter/material.dart';
import 'package:workout_planer/constants/colors.dart';

class ProgresCard extends StatefulWidget {
  final double progresValue;
  final int total;
  const ProgresCard({
    super.key,
    required this.progresValue,
    required this.total,
  });

  @override
  State<ProgresCard> createState() => _ProgresCardState();
}

class _ProgresCardState extends State<ProgresCard> {
  @override
  Widget build(BuildContext context) {
    int done = (widget.progresValue * widget.total).toInt();
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kGradientTopColor, kGradientBottomColor],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Proteins, Fast & \nCarbohydrates",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w900,
                color: kMainWhiteColor,
              ),
            ),
            SizedBox(height: 40),
            LinearProgressIndicator(
              value: widget.progresValue,
              backgroundColor: kGradientBottomColor,
              valueColor: AlwaysStoppedAnimation(kMainWhiteColor),
              minHeight: 15,
              borderRadius: BorderRadius.circular(100),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTag("done", done.toString()),
                _buildTag("total", widget.total.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kMainWhiteColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kMainWhiteColor,
          ),
        ),
      ],
    );
  }
}
