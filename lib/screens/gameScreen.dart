import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class gameScreen extends StatefulWidget {
  const gameScreen({super.key});

  @override
  State<gameScreen> createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> {
  bool xTurn = true;
  List<String> display = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  String result = '';
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
                          onTap: () {
                            _tapped(index);
                          },
                          child: Container(
                              child: Center(
                                  child: Text(display[index],
                                      style: GoogleFonts.lato(
                                          color: Colors.white, fontSize: 69))),
                              decoration: BoxDecoration(
                                  color: colors.secondaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 5, color: colors.primaryColor))),
                        );
                      }))),
              Expanded(
                  flex: 2,
                  child: Text(
                    result,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (xTurn && display[index] == '') {
        display[index] = 'X';
      } else if (!xTurn && display[index] == "") {
        display[index] = 'O';
      }
      xTurn = !xTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    //check first row
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != "") {
      setState(() {
        result = 'Player ' + display[0] + ' wins';
      });
    }

    //check second row
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != "") {
      setState(() {
        result = 'Player ' + display[3] + ' wins';
      });
    }
    //check third row
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != "") {
      setState(() {
        result = 'Player ' + display[3] + ' wins';
      });
    }
    //check first column
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != "") {
      setState(() {
        result = 'Player ' + display[0] + ' wins';
      });
    }
    //check second column
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != "") {
      setState(() {
        result = 'Player ' + display[1] + ' wins';
      });
    }
    //check third column
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != "") {
      setState(() {
        result = 'Player ' + display[2] + ' wins';
      });
    }
    //check first diagonal
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != "") {
      setState(() {
        result = 'Player ' + display[0] + ' wins';
      });
    }
    //check second diagonal
    if (display[2] == display[4] &&
        display[2] == display[7] &&
        display[2] != "") {
      setState(() {
        result = 'Player ' + display[2] + ' wins';
      });
    }
  }
}
