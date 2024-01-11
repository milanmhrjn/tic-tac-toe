import 'package:flutter/material.dart';
import 'package:tictactoe/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class gameScreen extends StatefulWidget {
  const gameScreen({super.key});

  @override
  State<gameScreen> createState() => _gameScreenState();
}

class _gameScreenState extends State<gameScreen> {
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
  bool xTurn = true;
  String result = "";
  var xScore = 0;
  var oScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
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
                                      fontSize: 30,
                                      color: colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  xScore.toString(),
                                  style: GoogleFonts.lato(
                                      color: colors.white, fontSize: 25),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Player O",
                                  style: GoogleFonts.lato(
                                      fontSize: 30,
                                      color: colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  oScore.toString(),
                                  style: GoogleFonts.lato(
                                      color: colors.white, fontSize: 25),
                                )
                              ],
                            )
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
                              onTapped(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: colors.secondaryColor,
                                  border: Border.all(
                                      width: 10, color: colors.primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  display[index],
                                  style: GoogleFonts.lato(
                                      color: colors.white, fontSize: 65),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            result,
                            style: GoogleFonts.lato(
                                color: colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                clearBoard();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "Restart",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ))));
  }

//function to display X and O while tapping boxes
  void onTapped(int index) {
    setState(() {
      if (xTurn && display[index] == "") {
        display[index] = "X";
        filledBoxes++;
      } else if (!xTurn && display[index] == "") {
        display[index] = "O";
        filledBoxes++; //whenever we tap the box filleBoxes value will increase with 1
      }
      xTurn =
          !xTurn; // changing x turn value, initially it will be true but when this line executes it will be false
      checkWinner(); //calling function, if x is winner or o is winner or draw
    });
  }

  void checkWinner() {
    //check first row
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != "") {
      result = "Player " + display[0] + " is a winner.";
      updateScore(display[0]);
    }
    //check second row
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != "") {
      result = "Player " + display[3] + " is a winner.";
      updateScore(display[3]);
    }
    //check third row
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != "") {
      result = "Player " + display[8] + " is a winner.";
      updateScore(display[6]);
    }
    //check first column
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != "") {
      result = "Player " + display[0] + " is a winner.";
      updateScore(display[0]);
    }
    //check second column
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != "") {
      result = "Player " + display[1] + " is a winner.";
      updateScore(display[1]);
    }
    //check third column
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != "") {
      result = "Player " + display[2] + " is a winner.";
      updateScore(display[2]);
    }
    //check first diagonal
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != "") {
      result = "Player " + display[0] + " is a winner.";
      updateScore(display[0]);
    }
    //check second diagonal
    if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != "") {
      result = "Player " + display[2] + " is a winner.";
      updateScore(display[2]);
    }
    //check for draw
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        result = "Nobody Wins.";
      });
    }
  }

  void updateScore(String winner) {
    if (winner == "X") {
      xScore++;
    } else if (winner == "O") {
      oScore++;
    }
    winnerFound = true;
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        display[i] = "";
      }
      result = "";
    });

    filledBoxes = 0;
  }
}
