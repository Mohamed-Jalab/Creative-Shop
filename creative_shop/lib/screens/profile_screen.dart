
import 'package:creative_shop/screens/contact_us_screen.dart';
import 'package:creative_shop/screens/login_screen.dart';
import 'package:creative_shop/shared/component.dart';
import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'about_us_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: secondaryColor,
            child: Text(publicModel.username[0].toUpperCase(),
                style: const TextStyle(
                    color: whiteColor, fontWeight: FontWeight.bold)),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(publicModel.username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: whiteColor)),
            const SizedBox(
              height: 4,
            ),
            Text(publicModel.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: whiteColor)),
          ],
        ),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.history, text: 'Purchase History'),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.notifications_none_outlined,
                              text: 'Notifications'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.place_outlined,
                              text: 'Delivery Addresses'),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.settings_outlined,
                                    color: primaryColor,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Settings',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Column(
                        children: [
                          buildTab(
                              icon: Icons.info_outline_rounded,
                              text: 'About Us',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AboutUsScreen(),
                                  ),
                                );
                              }),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade200,
                          ),
                          buildTab(
                            icon: Icons.call,
                            text: 'Contact Us',
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ContactUsScreen())),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: SizedBox(
                      height: 220,
                      child: Column(
                        children: [
                          const Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(),
                          ),
                          const Text("Are you sure to logout"),
                          const Expanded(child: SizedBox()),
                          buildBigButton(
                            context,
                            child: const Text('Logout'),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              sharedPreferences?.setBool('login', false);
                              GoogleSignIn().signOut();
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => const LoginScreen(),
                                  ),
                                ),
                              );
                              selectedInd = 1;
                            },
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            child: TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.grey.withOpacity(0.1);
                                    }
                                    return Colors.transparent;
                                  },
                                ),
                              ),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                          ],
                      ),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: secondaryColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              child: const Text('Logout',
                  style: TextStyle(fontSize: 24, color: whiteColor)),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTab({IconData? icon, String? text, void Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        child: Row(
          children: [
            Icon(icon, color: primaryColor, size: 25),
            const SizedBox(width: 20),
            Text(
              '$text',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
//check