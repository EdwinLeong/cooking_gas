import 'package:flutter/material.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold(
      {required this.title,
      required this.child,
      this.bottomBar,
      this.backgroundColor,
      this.actions});

  final String title;
  final Widget child;
  final Widget? bottomBar;
  final Color? backgroundColor;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    // Remove the SafeArea for the statusBarBrightness
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: actions,
          )
        ],
      ),
      bottomNavigationBar: bottomBar,
      body: child,
    );
  }
}
