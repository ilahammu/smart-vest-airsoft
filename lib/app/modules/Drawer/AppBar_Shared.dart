import 'package:flutter/material.dart';
import 'package:vest_keren/app/modules/Drawer/AppBar.dart';

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
          CustomAppBar(), // ⬅️ appbar selalu muncul
          Expanded(child: child), // ⬅️ halaman kontennya
        ],
      ),
    );
  }
}
