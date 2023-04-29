class Player {
  static const x = "X";
  static const o = "O";
  static const empty = '';
}

class Game {
  static final boardLength = 9;

  List<String> board = [];

  static List<String> initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool winnerCheck(String player, int index, List<List<String>> scoreboard) {
    //TODO find winner
    bool result = false;
    int scoreCount = 0;
    List<int> arrayIndex = [0, 0];

    //Find row for array index for scoreboard
    if (index < 3) {
      arrayIndex = [0, index];
    } else if (index <= 5) {
      arrayIndex = [1, index - 3];
    } else {
      arrayIndex = [2, index - 6];
    }

    scoreboard[arrayIndex[0]][arrayIndex[1]] = player;
    print(scoreboard[arrayIndex[0]][arrayIndex[1]]);
    scoreboard[arrayIndex[0]].forEach((element) {
      print('element $element');
      print('player $player');
      if (element == player) {
        print('scoreCount1 $scoreCount');
        scoreCount++;
      }
    });
    if (scoreCount != 3) {
      scoreCount = 0;
      for (int n = 0; n < scoreboard[arrayIndex[0]].length; n++) {
        print(scoreboard);
        print('player2 $player');
        if (scoreboard[n][arrayIndex[1]] == player) {
          print('scoreCount" $scoreCount');
          scoreCount++;
        }
      }
    }
    print(scoreCount);
    if (scoreCount == 3) {
      result = true;
    }
    return result;
  }

//TODO:
// - Player
// - Game
//  - variables - whos turn it is?
//  - board
//  - winnerCheck()
}
