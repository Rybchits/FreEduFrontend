import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  final String placeholder;
  final FocusNode? focus;
  final TextEditingController? controller;

  final BorderRadius borderFieldRadius = BorderRadius.circular(12.0);
  final Color borderColor = Colors.black.withOpacity(0.15);

  SearchField({Key? key, this.placeholder = "Поиск по названию...", this.controller, this.focus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    final searchSuffixIcon = Container(
        padding: const EdgeInsets.only(right: 15),
        child: Icon( Icons.search, color: Theme.of(context).primaryColorLight, size: 32.0));

    return TextFormField(
      focusNode: focus,
      cursorColor: primaryColor,
      style: GoogleFonts.montserrat(fontSize: 16.0),
      decoration: InputDecoration(
        filled: true,
          fillColor: Colors.white,
          hintText: placeholder,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderFieldRadius,
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2),
              borderRadius: borderFieldRadius),
          suffixIcon: searchSuffixIcon
      ),
      controller: controller,
    );
  }
}
