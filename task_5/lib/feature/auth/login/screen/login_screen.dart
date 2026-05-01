import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widget/custom_text_field.dart';
import '../widget/profile_image.dart';
import '../widget/submit_btn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: const Text("Flutter UI Task"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 2,
      ),

      body: Center(
        child: Container(
          width: 90.w,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
                offset: Offset(0, 5),
              )
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// Image
              const ProfileImage(),

              SizedBox(height: 2.h),

              /// Text
              Text(
                "Welcome to Flutter",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 1.h),

              /// Star Icon
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 10.w,
              ),

              SizedBox(height: 3.h),

              /// Email
              const CustomTextField(hint: "Email"),

              SizedBox(height: 2.h),

              /// Password
              const CustomTextField(
                hint: "Password",
                isPassword: true,
              ),

              SizedBox(height: 3.h),

              /// Button
              const SubmitButton(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, size: 6.w),
      ),
    );
  }
}