import 'package:flutter/gestures.dart';

enum LoadState { loading, success, failure }

enum Direction { up, down, left, right, none }

class VerticalDragInfo {
  bool cancel = false;

  Direction? direction;

  void update(Offset primaryDelta) {
    Direction tmpDirection;
    if (primaryDelta.dy > 0) {
      tmpDirection = Direction.down;
    } else if (primaryDelta.dy < 0){
      tmpDirection = Direction.up;
    } else if (primaryDelta.dx > 0 ) {
      tmpDirection = Direction.right;
    } else if (primaryDelta.dx < 0){
      tmpDirection = Direction.left;
    }else{
      tmpDirection = Direction.none;
    }

    if (direction != null && tmpDirection != direction) {
      cancel = true;
    }

    direction = tmpDirection;
  }
}
