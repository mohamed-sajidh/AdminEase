import 'package:adminease/core/app_colors.dart';
import 'package:adminease/screens/admin/user/user_page.dart';
import 'package:adminease/widgets/logout_popup.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: screenHeight * 0.10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: screenWidth * 0.07,
              child: const Icon(Icons.person),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Text(
                "welcome admin",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showLogoutDialog(context);
              },
              child: const Icon(
                Icons.person_add_alt,
                color: AppColors.red,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.05,
              width: screenWidth * screenWidth,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(40),
                  bottomEnd: Radius.circular(40),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: screenHeight * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    buildMenuItem(
                      Icons.note_add_outlined,
                      'Quotation',
                      screenWidth,
                      context,
                      const UserPage(),
                      false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    IconData icon,
    String title,
    double screenWidth,
    BuildContext context,
    Widget targetPage,
    bool isSalesOrder,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetPage),
        );
      },
      child: SizedBox(
        height: 80,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 55,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.lightPurple,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(14),
                  right: Radius.circular(14),
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: screenWidth * 0.08,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
