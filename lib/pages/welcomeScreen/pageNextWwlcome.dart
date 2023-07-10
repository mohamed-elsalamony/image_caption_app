import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:team_project_final/constant/colors.dart';

class NextPageWelcome extends StatelessWidget {
  const NextPageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 50),
                  padding: EdgeInsets.only(left: 50),
                  child: Center(
                    child: Text(
                      "if you are normal press next otherwiseswipe on the screen",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: 380,
                  height: 247,
                  color: AppColors.ContainerColor),
              InkWell(
                onTap: () {
                  
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(240, 0, 0, 30),
                  decoration: BoxDecoration(
                      color: AppColors.SignColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 56,
                  width: 144,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_right,
                        size: 40,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
