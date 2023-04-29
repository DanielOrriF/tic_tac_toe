class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardLength = 9;

  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool winnerCheck(String player, int index, List<List<String>> scoreboard) {
    //if(winner){
    //return true;
    // }
    bool result = false;
    List<int> arrayIndex = [0, 0];
    int scoreCount = 0;
    if (index < 3) {
      arrayIndex = [0, index];
    } else if (index <= 5) {
      arrayIndex = [1, index - 3];
    } else {
      arrayIndex = [2, index - 6];
    }

    scoreboard[arrayIndex[0]][arrayIndex[1]] = player;
    scoreboard[arrayIndex[0]].forEach((element) {
      if (element == player) {
        print('scoreCunt1 $scoreCount');
        scoreCount++;
      }
    });
    if (scoreCount != 3) {
      scoreCount = 0;
      for (int n = 0; n < scoreboard[arrayIndex[0]].length; n++) {
        print(scoreboard[n]);
        if (scoreboard[n][arrayIndex[1]] == player) {
          print('scoreCount2 $scoreCount');
          scoreCount++;
        }
      }
    }
    if (scoreCount == 3) {
      return true;
    }

    return result;
  }

//TODO:
//  - winnerCheck()
}
