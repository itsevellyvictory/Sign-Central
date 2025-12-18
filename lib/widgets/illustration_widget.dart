import 'package:flutter/material.dart';

class IllustrationWidget extends StatelessWidget {
  final String illustrationName;
  final double? height;
  final double? width;

  const IllustrationWidget({
    super.key,
    required this.illustrationName,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/$illustrationName.png',
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
