import 'package:daya_foundation/inspiration_screen.dart';
import 'package:daya_foundation/our_team_screen.dart';
import 'package:daya_foundation/our_trust_members_screen.dart';
import 'package:daya_foundation/our_work.dart';
import 'package:daya_foundation/we_work_screen.dart';
import 'package:flutter/material.dart';

import 'contact_us_screen.dart';
import 'gau_upchar_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

