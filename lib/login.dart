import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///输入法切换的快捷键 control+space
///command+option+L 格式化代码
//登陆页面
// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  static final TextEditingController _controllerNameTextField =
      new TextEditingController();

  static final TextEditingController _controllerPwdTextField =
      new TextEditingController();

  /// login
  static void login() {
    print('login');
    print('input userName: ${_controllerNameTextField.text}');
    print('input pwd: ${_controllerPwdTextField.text}');
  }

  static void resetBtn() {
    _controllerNameTextField.clear();
    _controllerPwdTextField.clear();
    print("reset");
  }

  ///
  Widget banner = new Container(
    child: Center(
      child: Text("xxxx公司产品",
          style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
    ),
  );

  Widget loginWidget = new Container(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new TextField(
            textAlign: TextAlign.left, //文本对齐方式
            controller: _controllerNameTextField,
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "用户名称",
              hintText: '输入用户名称',
            ),
            onSubmitted: (text) {
              //内容提交(按回车)的回调
              print('submit $text');
            },
          ),

          new TextField(
            obscureText: true,
            textAlign: TextAlign.left,
            //文本对齐方式
            controller: _controllerPwdTextField,
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              labelText: "密码",
              hintText: '输入密码',
            ),
            //是否是密码
            onSubmitted: (text) {
              //内容提交(按回车)的回调
              print('submit $text');
            },
          ),

          ///添加间隔
          SizedBox(
            height: 50,
          ),

          ///login btn
          MaterialButton(
            onPressed: login,
            textColor: Colors.white,
            color: Colors.green,
            child: Text("登录"),
          ),

          ///reset btn
          MaterialButton(
            onPressed: resetBtn,
            textColor: Colors.white,
            color: Colors.orangeAccent,
            child: Text("重置"),
          )
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
//    ///监听输入的文本
//    _controllerNameTextField.addListener(() {
//      print('input ${_controllerNameTextField.text}');
//    });
//
//    ///监听输入的文本
//    _controllerPwdTextField.addListener(() {
//      print('input ${_controllerPwdTextField.text}');
//    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("Login"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
//        child: buildTextField(controller),
        child: loginWidget,
      ),
    );
  }
}
