import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/project_details_model.dart';

class OnGoingCampaignController extends GetxController {
  String jsonString = '''[
  {
    "projectTitle": "Swap (LiveWire)",
    "projectType": "Re-commerce Platform",
    "projectDescriptions": "20+ physical shops all over Bangladesh and beyond!",
    "daysLeft": "6 Days Left",
    "logo": "assets/swap_logo.png",
    "estimatedProfit": "15",
    "riskGrade": "B",
    "repaymentDuration": "6 months, 3 installments"
  },
  {
    "projectTitle": "Turtle Venture",
    "projectType": "Capacity Development Trainer",
    "projectDescriptions": "Served 115+ Startups & SMEs, worked with 50+ Local & International...",
    "daysLeft": "1 Day Left",
    "logo": "assets/turtle_venture.png",
    "estimatedProfit": "20",
    "riskGrade": "B",
    "repaymentDuration": "6 months, 3 installments"
  }
]
''';

  RxList<ProjectInfo> projects = <ProjectInfo>[].obs;

  RxDouble investAmount = 40000.00.obs;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onReady() {
    List<dynamic> jsonList = json.decode(jsonString);
    projects.value = jsonList.map((json) => ProjectInfo.fromJson(json)).toList();

    textEditingController.text = formatMoneyReverse();
    print(projects.first.projectTitle);
    print(projects.last.projectTitle);

    super.onReady();
  }

  double getRepaymentAmount(int index) {
    return investAmount.value + investAmount.value * double.parse(projects[index].estimatedProfit) / 100;
  }

  String formatMoney(String input) {
    if (input.endsWith('K')) {
      double value = double.parse(input.substring(0, input.length - 1));
      return '${value.toStringAsFixed(0)},000/-';
    } else {
      return input;
    }
  }

  String formatMoneyReverse() {
    double value = investAmount.value;
    if (value >= 1000) {
      if (value % 1000 == 0) {
        return '${(value ~/ 1000)}K';
      } else {
        return '${(value / 1000).toStringAsFixed(2)}K';
      }
    } else {
      return value.toStringAsFixed(2);
    }
  }
}
