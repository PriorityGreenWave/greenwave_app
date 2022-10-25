import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MessageFlushbar extends StatelessWidget {
  final String message;
  final bool error;
  const MessageFlushbar({this.message, this.error, Key key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        width: double.maxFinite,
        child: error == true ? _errorBar(context) : _successBar(context));
  }

  Widget _errorBar(context) {
    return Flushbar(
      animationDuration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: 'Ocorreu uma falha',
      message: message == null ? 'Falha ao realizar a chamada!' : message,
      icon: Icon(
        Icons.info,
        size: 28,
        color: Colors.white,
      ),
      leftBarIndicatorColor: Colors.red,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  Widget _successBar(context) {
    return Flushbar(
      animationDuration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      title: 'Ocorreu uma falha',
      message: message == null ? 'Sucesso ao realizar a chamada' : message,
      icon: Icon(
        Icons.info,
        size: 28,
        color: Colors.white,
      ),
      leftBarIndicatorColor: Colors.red,
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
