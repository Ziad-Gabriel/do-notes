import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavTopBarButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final BorderRadiusGeometry borderRadius;
  final Color color;
  final VoidCallback onPressed;

  const NavTopBarButton({
    super.key,
    required this.title,
    required this.icon,
    required this.borderRadius,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: color.withAlpha(200),
        borderRadius: borderRadius,
        border: Border.all(color: color, width: 2),
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(title, style: GoogleFonts.viga(color: Colors.white)),
        icon: Icon(icon, color: Colors.black),
      ),
    );
  }
}
