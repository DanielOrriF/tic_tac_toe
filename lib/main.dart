import 'package:flutter/material.dart';

import 'logic/game.dart';
import 'ui/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _GameScreen();
}

class _GameScreen extends State<MyHomePage> {
  String value = 'X';
  bool gameOver = false;
  String result = '';
  int turn = 0;
  List<List<String>> scoreboard = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];
  Game game = Game();

  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    print('game $game');
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: MainColor.background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 400, //TODO - setja í breytu
                  height: 400, //TODO - setja í breytu
                  child: GridView.count(
                      crossAxisCount: 9 ~/ 3,
                      //TODO - setja í breytur
                      padding: EdgeInsets.all(16.0),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: List.generate(9, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (game.board[index].isEmpty) {
                                game.board[index] = value;
                              }
                              turn++;
                              if (gameOver) {
                                result = 'Game is over $value is the looser';
                              } else if (!gameOver && turn == 9) {
                                result = 'It is a draw';
                                gameOver = true;
                              } else {
                                gameOver =
                                    game.winnerCheck(value, index, scoreboard);
                              }
                              if (value == 'X') {
                                value = 'O';
                              } else {
                                value = 'X';
                              }
                            });
                          },
                          child: Container(
                            width: 200, //TODO - setja í breytu
                            height: 200, //TODO - setja í breytu
                            decoration: BoxDecoration(
                              color: MainColor.white,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                              child: Text(
                                game.board[index],
                                style: TextStyle(
                                    fontSize: 64,
                                    color: game.board[index] == 'X'
                                        ? MainColor.x
                                        : MainColor.o),
                              ),
                            ),
                          ),
                        );
                      }))),
              Text(result),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    game.board = Game.initGameBoard();
                    value = 'X';
                    result = '';
                    gameOver = false;
                    turn = 0;
                    scoreboard = [
                      ["", "", ""],
                      ["", "", ""],
                      ["", "", ""],
                    ];
                  });
                },
                icon: Icon(Icons.replay),
                label: Text(
                  'Repeat game',
                ),
              )
            ]),
      ),
    );
  }
}
