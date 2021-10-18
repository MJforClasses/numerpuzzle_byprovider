import 'dart:math';
import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  List<int> randomNum = List.generate(9, (index) => 10);

  Future generateList() {
    randomNum = List.generate(10, (index) => 10);
    for (int i = 0; i < 9; i++) {
      int temp = Random().nextInt(9);
      if (!randomNum.contains(temp)) {
        randomNum[i] = temp;
        i == 8 ? i++ : null;
      } else {
        i--;
      }
    }
    return Future.value();
  }

  responseOnTap(int no) {
  int a = 9,b = 9,c = 9,d = 9;
  if(no == 0){
      a = 1;
      b = 3;
      c = 9;
      d = 9;
  }else if(no == 1){
    a = 0;
    b = 2;
    c = 3;
    d = 9;
  } else if(no == 2){
    a = 1;
    b = 5;
    c = 9;
    d = 9;
  } else if(no == 4){
    a = 1;
    b = 3;
    c = 5;
    d = 7;
  } else if(no == 5){
    a = 2;
    b = 4;
    c = 8;
    d = 9;
  } else if(no == 6){
    a = 3;
    b = 7;
    c = 9;
    d = 9;
  } else if(no == 7){
    a = 4;
    b = 6;
    c = 8;
    d = 9;
  } else if(no == 8){
    a = 5;
    b = 7;
    c = 9;
    d = 9;
  }

      if (randomNum[a] == 10) {
        randomNum[no] = randomNum[no] + randomNum[a];
        randomNum[a] = randomNum[no] - randomNum[a];
        randomNum[no] = randomNum[no] - randomNum[a];
      } else if (randomNum[b] == 10) {
        randomNum[no] = randomNum[no] + randomNum[b];
        randomNum[b] = randomNum[no] - randomNum[b];
        randomNum[no] = randomNum[no] - randomNum[b];
      } else if (randomNum[c] == 10 && c != 9) {
        randomNum[no] = randomNum[no] + randomNum[c];
        randomNum[c] = randomNum[no] - randomNum[c];
        randomNum[no] = randomNum[no] - randomNum[c];
      } else if (randomNum[d] == 10 && c != 9 && d != 9) {
        randomNum[no] = randomNum[no] + randomNum[d];
        randomNum[d] = randomNum[no] - randomNum[d];
        randomNum[no] = randomNum[no] - randomNum[d];
      }
      notifyListeners();
  }
}

/*
* 1 3 -- 0
* 0 2 4  -- 1
* 1 5 -- 2
* 0 4 6 -- 3
* 1 3 5 7  -- 4
* 2 4 8  -- 5
* 3 7 -- 6
* 4 6 8 -- 7
* 5 7 -- 8
* */
