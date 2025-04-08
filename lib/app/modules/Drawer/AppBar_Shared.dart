import 'package:flutter/material.dart';

class AppbarShared extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const AppbarShared({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(child: child), // ⬅️ halaman kontennya
        ],
      ),
    );
  }
}
