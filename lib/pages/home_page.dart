import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planer/constants/colors.dart';
import 'package:workout_planer/constants/consant_values.dart';
import 'package:workout_planer/data/equipment_data.dart';
import 'package:workout_planer/data/exercise_data.dart';
import 'package:workout_planer/data/user_data.dart';
import 'package:workout_planer/pages/exercise_details_page.dart';
import 'package:workout_planer/widgets/progres_card.dart';
import 'package:workout_planer/widgets/reusable/exercise_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // date time
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');
  // --------------------------------------------------------
  // get user date
  final userData = user;

  // get exercies data----------------
  final exerciselist = ExerciseData().exerciseList;
  final equipmentlist = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatterDate = formetter.format(now);
    String formeteDay = dayFormat.format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
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
                  user.fullName,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 20),
                ProgresCard(progresValue: 0.8, total: 100),
                SizedBox(height: 20),
                Text(
                  "Today's Activity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Warmup",
                              exerciseDesciption:
                                  "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perspiciatis commodi nihil est iusto, quis porro expedita consequatur quasi temporibus repellendus!",
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Warmup",
                        imageUrl: "assets/images/exercises/downward-facing.png",
                        description: "See more",
                      ),
                    ),
                    ExerciseCard(
                      title: "equipments",
                      imageUrl: "assets/images/equipments/dumbbells2.png",
                      description: "See more",
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ExerciseCard(
                      title: "Exercise",
                      imageUrl: "assets/images/exercises/triangle.png",
                      description: "See more",
                    ),
                    ExerciseCard(
                      title: "Stretching",
                      imageUrl: "assets/images/exercises/yoga.png",
                      description: "See more",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
