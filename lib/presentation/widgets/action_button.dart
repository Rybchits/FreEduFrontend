import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {
  final Function()? onClick;
  final Color? color;
  final String label;
  const ActionButton({Key? key, required this.label, this.onClick, this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(label,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(fontSize: 16.0, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.0)),
        primary: color,
        padding: const EdgeInsets.symmetric(vertical: 10),
        elevation: 5.0,
      ),
    );
  }
}
