import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12.w,
      backgroundImage: const NetworkImage(
        "https://i.pravatar.cc/300",
      ),
    );
  }
}