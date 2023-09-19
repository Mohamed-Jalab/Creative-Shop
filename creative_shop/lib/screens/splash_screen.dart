import 'dart:async';

import 'package:creative_shop/screens/home.dart';
import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'onboarding_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => setState(() {
        opacity = 1;
      }),
    );
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          if (login) return const Home();
          return const OnboardingScreen();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 900),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Image.asset('asset/images/logo-no-background.png'),
          ),
        ),
      ),
      // SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: GoogleMap(
      //     mapType: MapType.normal,
      //     initialCameraPosition: const CameraPosition(
      //       target: LatLng(37.42796133580664, -122.085749655962),
      //       zoom: 14.4746,
      //     ),
      //     onMapCreated: (GoogleMapController controller) {
      //       Completer<GoogleMapController>().complete(controller);
      //     },
      //   ),
      // ),
    );
  }
}
