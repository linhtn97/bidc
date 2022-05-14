import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({
    Key? key,
    required this.size,
    required this.imageAssetLink,
  }) : super(key: key);

  final double size;
  final String imageAssetLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(imageAssetLink),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
