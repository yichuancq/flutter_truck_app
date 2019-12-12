import 'package:flutter/material.dart';

/// 自定义按钮
class MyButton extends StatelessWidget {
  //callback
  @required
  VoidCallback onPress;
  Text title;
  IconButton iconButton;

  //constructor
  MyButton({this.onPress, this.title, this.iconButton});

  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
      onPressed: this.onPress,
      color: Colors.blueGrey,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[iconButton, title],
      ),
    );
  }
}
