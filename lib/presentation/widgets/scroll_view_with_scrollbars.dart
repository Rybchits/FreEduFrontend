import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollViewWithScrollbars extends StatefulWidget {
  const ScrollViewWithScrollbars({Key? key, required this.child, this.axis = Axis.vertical}) : super(key: key);
  final Widget child;
  final Axis axis;

  @override
  _ScrollViewWithScrollbarsState createState() => _ScrollViewWithScrollbarsState();
}

class _ScrollViewWithScrollbarsState extends State<ScrollViewWithScrollbars> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20),
        scrollDirection: widget.axis,
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }
}