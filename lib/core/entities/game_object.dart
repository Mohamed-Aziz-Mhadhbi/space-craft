import 'package:flutter/material.dart';

import 'vector2.dart';
 
/// base Object of this game
abstract class GameObject {
  Vector2 get position;
  Size get size;
  Color get color;
}
