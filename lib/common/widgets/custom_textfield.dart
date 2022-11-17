import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}

class CustomTextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  bool isObscure;
  CustomTextFieldPassword({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.isObscure = true,
  }) : super(key: key);

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black38,
        )),
        suffixIcon: IconButton(
          icon: Icon(
            widget.isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              widget.isObscure = !widget.isObscure;
            });
          },
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $widget.hintText';
        }
        return null;
      },
      maxLines: widget.maxLines,
    );
  }
}
