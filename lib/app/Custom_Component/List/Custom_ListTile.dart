import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatefulWidget {
  final String? title;
  final IconData? iconLeading;
  final bool? isSelected;
  final VoidCallback onClick;

  const CustomListTile({
    super.key,
    this.title,
    this.iconLeading,
    required this.onClick,
    this.isSelected,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: widget.isSelected ?? false
            ? Colors.deepPurple
            : _isHovering
                ? Colors.deepPurple
                : Colors.transparent,
        child: Card(
          color: Colors.transparent,
          elevation: _isHovering ? 0 : 0,
          child: ListTile(
            onTap: () {
              widget.onClick();
            },
            dense: true,
            leading: Icon(
              widget.iconLeading!,
              color: widget.isSelected ?? false
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : Colors.black,
              size: 30, // Ukuran tetap tanpa isDrawerExpanded
            ),
            title: Text(
              widget.title!,
              style: GoogleFonts.ramabhadra(
                color: widget.isSelected ?? false
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 0, 0, 0),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
