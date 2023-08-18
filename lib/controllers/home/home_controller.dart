import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app_ui_design/views/ongoing_campaigns/ongoing_campaigns_view.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  RxList<Widget> pages = [
    const Center(
      child: Icon(
        Icons.home,
        size: 100,
      ),
    ),
    OnGoingCampaignsView(),
    const Center(
      child: Icon(
        Icons.person,
        size: 100,
      ),
    ),
  ].obs;
}
