import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
// import 'package:google_fonts/google_fonts.dart';

class gameScreen extends StatefulWidget {
  const gameScreen({super.key});

  @override
  State<gameScreen> createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
    );
  }
}
