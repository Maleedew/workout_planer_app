import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planer/constants/colors.dart';
import 'package:workout_planer/models/exercise_model.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDesciption;
  final List<Exercise> exerciseList;
  const ExerciseDetailsPage({
    super.key,
    required this.exerciseTitle,
    required this.exerciseDesciption,
    required this.exerciseList,
  });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  // date time
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatterDate = formetter.format(now);
    String formeteDay = dayFormat.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$formatterDate $formeteDay",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kSubtitleColor,
              ),
            ),
            Text(
              widget.exerciseTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: kMainColor,

              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.exerciseDesciption,)
          ],
        ),
      ),
    );
  }
}