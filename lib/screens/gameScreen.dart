import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class gameScreen extends StatefulWidget {
  const gameScreen({super.key});

  @override
  State<gameScreen> createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> {
  List<String> display = ['', '', '', '', '', '', '', '', ''];
  bool xTurn = true;
  String result = '';
  var xScore = 0;
  var oScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Player X",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          xScore.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 25, color: colors.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Player O",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          oScore.toString(),
                          style: GoogleFonts.lato(
                              fontSize: 25, color: colors.white),
                        )
                      ],
                    ),
                  ],
                )),
            Expanded(
                flex: 3,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onTap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: colors.secondaryColor,
                            border: Border.all(
                                color: colors.primaryColor, width: 10),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            display[index],
                            style: GoogleFonts.lato(
                                color: colors.white, fontSize: 60),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 2,
                child: Text(
                  result,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      )),
    );
  }

  void onTap(int index) {
    setState(() {
      if (xTurn && display[index] == "") {
        display[index] = "X";
      } else if (!xTurn && display[index] == "") {
        display[index] = "O";
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
      result = 'Player ' + display[0] + ' Wins';
    }
    //check second row
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != "") result = 'Player ' + display[3] + ' Wins';
    //check third row
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != "") result = 'Player ' + display[6] + ' Wins';
    //check first column
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != "") result = 'Player ' + display[0] + ' Wins';
    //check second column
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != "") result = 'Player ' + display[1] + ' Wins';
    //check third column
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != "") result = 'Player ' + display[2] + ' Wins';
    //check first diagonal
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != "") result = 'Player ' + display[0] + ' Wins';
    //check second diagonal
    if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != "") result = 'Player ' + display[2] + ' Wins';
  }
}
