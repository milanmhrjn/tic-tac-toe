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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(flex: 1, child: Text("Score Board")),
              Expanded(
                  flex: 3,
                  child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: colors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 5, color: colors.primaryColor))),
                        );
                      }))),
              Expanded(flex: 2, child: Text("Timer")),
            ],
          ),
        ),
      ),
    );
  }
}
