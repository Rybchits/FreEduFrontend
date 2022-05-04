import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabeledInputField extends StatelessWidget {

  final String label;
  final TextEditingController? controller;
  final FocusNode? focus;
  final bool isTextVisible;
  final Widget? endIcon;

  final BorderRadius borderFieldRadius = BorderRadius.circular(12.0);
  final Color borderColor = Colors.black.withOpacity(0.15);

  LabeledInputField({Key? key, this.label = "", this.controller, this.focus, this.isTextVisible = true, this.endIcon })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.montserrat(fontSize: 18.0, color: primaryColor, fontWeight: FontWeight.w600)),
        const SizedBox(height: 5),
        TextFormField(
          obscureText: !isTextVisible,
          focusNode: focus,
          cursorColor: primaryColor,
          style: GoogleFonts.montserrat(fontSize: 16.0),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderFieldRadius,
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                  borderRadius: borderFieldRadius),
              suffixIcon: endIcon
          ),
          controller: controller,
        ),
      ],
    );
  }
}
