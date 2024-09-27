import 'package:flutter/material.dart';

class YesNo extends StatefulWidget {
  final bool votacion;
  const YesNo({required this.votacion, super.key});

  @override
  State<YesNo> createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {
  @override
  Widget build(BuildContext context) {
     if (widget.votacion) {
      return Image.asset("lib/assets/images/yes.png");
    } else{
      return Image.asset("lib/assets/images/no.png");
    }
  }
}