import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investment_app_ui_design/controllers/ongoing_campaign_controller.dart';
import 'package:investment_app_ui_design/models/project_details_model.dart';
import 'package:investment_app_ui_design/utils/app_colors.dart';
import 'package:investment_app_ui_design/utils/app_constraints.dart';

class OnGoingCampaignsView extends StatelessWidget {
  OnGoingCampaignsView({Key? key}) : super(key: key);

  final OnGoingCampaignController controller = Get.put(OnGoingCampaignController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Campaigns'),
        actions: [
          IconButton(
            icon: const Icon(Icons.message_outlined),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: controller.projects.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return projectListItem(controller.projects[index], index);
            },
          ),
          bottomInvestManageWidget(),
        ],
      ),
    );
  }

  Widget projectListItem(ProjectInfo project, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(project.projectTitle, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400)),
            const Spacer(),
            Icon(
              Icons.access_time_outlined,
              color: project.daysLeft == "1 Day Left" ? Colors.red : AppColors.lightGreyColor,
              size: 16,
            ),
            AppConstrains.width5,
            Text(project.daysLeft,
                style: TextStyle(color: project.daysLeft == "1 Day Left" ? Colors.red : AppColors.lightGreyColor, fontSize: 10, fontWeight: FontWeight.w400)),
          ],
        ),
        AppConstrains.height10,
        Text(project.projectType, style: const TextStyle(color: AppColors.lightGreyColor, fontSize: 10, fontWeight: FontWeight.w400)),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width / 1.45,
              child: Text(
                project.projectDescriptions,
                style: const TextStyle(color: AppColors.lightGreyColor, fontSize: 12, fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
            ),
            const Spacer(),
            Image.asset(
              project.logo,
              height: 40,
              width: 70,
            )
          ],
        ),
        AppConstrains.height10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text("ESTIMATED PROFIT", style: TextStyle(color: AppColors.lightGreyColor, fontSize: 10, fontWeight: FontWeight.w400)),
                AppConstrains.height5,
                RichText(
                  text: TextSpan(
                    text: "${project.estimatedProfit}%",
                    style: const TextStyle(
                      color: AppColors.darkGreyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    children: const [
                      TextSpan(
                        text: ' per annum',
                        style: TextStyle(
                          color: AppColors.lightGreyColor,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Text("RISK GRADE", style: TextStyle(color: AppColors.lightGreyColor, fontSize: 10, fontWeight: FontWeight.w400)),
                AppConstrains.height5,
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFFF87147),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      project.riskGrade,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFF87147),
                        height: 1.13,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: Get.width / 5,
            ),
          ],
        ),
        AppConstrains.height10,
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: const Color(0xFFFCD34D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Projected Repayment Tk  ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              Obx(
                () => Text(
                  controller.getRepaymentAmount(index).toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                size: 11.33,
                color: Color(0xFF0F172A),
              ),
            ],
          ),
        ),
        AppConstrains.height10,
        Center(child: Text(project.repaymentDuration, style: const TextStyle(color: AppColors.lightGreyColor, fontSize: 10, fontWeight: FontWeight.w400))),
        index == controller.projects.length - 1 ? Container() : const Divider()
      ],
    );
  }

  Widget bottomInvestManageWidget() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: 360,
        height: 150,
        decoration: const BoxDecoration(
          color: AppColors.cardWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, -4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Adjust your investment amount and see live preview of projected repayment',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 1.33,
                    letterSpacing: 0.25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AppConstrains.height10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addMoneyWidget(),
                  showAmountWidget(),
                  reduceMoneyWidget(),
                ],
              ),
              Obx(() => Text("TK ${controller.formatMoney(controller.investAmount.value.toString())}",
                  style: const TextStyle(color: AppColors.lightGreyColor, fontSize: 10, fontWeight: FontWeight.w400)))
            ],
          ),
        ),
      ),
    );
  }

  Widget addMoneyWidget() {
    return ElevatedButton(
      onPressed: () {
        if (controller.investAmount.value == 40000) {
        } else {
          controller.investAmount.value = controller.investAmount.value - 10000;
          controller.textEditingController.text = controller.formatMoneyReverse();
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: const Color(0xFFFCD34D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_circle_outline,
            size: 22,
            color: Color(0xFF0F172A),
          ),
          Text(
            '10K',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  Widget showAmountWidget() {
    return Container(
        width: 150,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xFFFCD34D),
            width: 1,
          ),
        ),
        child: Obx(
          () => GestureDetector(
              onTap: () {
                controller.textEditingController.text = controller.formatMoney(controller.investAmount.value.toInt().toString());
                openDialog();
              },
              child: Text(
                "TK ${controller.formatMoneyReverse()}",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              )),
        ));
  }

  Widget reduceMoneyWidget() {
    return ElevatedButton(
      onPressed: () {
        controller.investAmount.value = controller.investAmount.value + 10000;
        controller.textEditingController.text = controller.formatMoneyReverse();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: const Color(0xFFFCD34D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_circle_outline_outlined,
            size: 22,
            color: Color(0xFF0F172A),
          ),
          Text(
            '10K',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openDialog() async {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  labelText: 'Investment Amount (Tk)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter value',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.investAmount.value = double.parse(controller.textEditingController.text);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(119, 40),
                      padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: const Color(0xFFFCD34D),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(119, 40),
                      padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: const Color(0xFF334155),
                      elevation: 0,
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
