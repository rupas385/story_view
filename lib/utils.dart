import 'package:flutter/gestures.dart';

enum LoadState { loading, success, failure }

enum Direction { up, down, left, right }

class VerticalDragInfo {
  bool cancel = false;

  Direction? direction;

  void update(Offset primaryDelta) {
    Direction tmpDirection;
    print("===================> DELTA DX: ${primaryDelta.dx} DELTA DY: ${primaryDelta.dy} <=======================");
    if (primaryDelta.dy > 0) {
      tmpDirection = Direction.down;
    } else if (primaryDelta.dy < 0){
      tmpDirection = Direction.up;
    } else if (primaryDelta.dx > 0 ) {
      tmpDirection = Direction.right;
    } else if (primaryDelta.dx < 0){
      tmpDirection = Direction.left;
    }else{
      tmpDirection = Direction.up;
    }

    if (direction != null && tmpDirection != direction) {
      cancel = true;
    }

    direction = tmpDirection;
  }
}
