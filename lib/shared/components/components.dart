
import 'package:flutter/material.dart';

Widget defaultButton({
  double height = 40.0,
  double width = double.infinity,
  Color background = Colors.black,
  double radius = 25,
  bool isUpperCase = true,
  required Function() function,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      height: height,
      width: width,

      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? labelText,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  bool isPassword = false,
  required FormFieldValidator<String> validator,
  IconData? suffixIcon,
  Function()? suffixPressed,
  Function()? onTap,
  ToolbarOptions? toolbarOptions,
  bool? showCursor,
  TextStyle? labelStyle,
  Widget? prefixIcon,
  InputBorder? enabledBorder,
  Color? focusColor,
  Color? cursorColor,
  InputBorder? focusedBorder,
  TextStyle? suffixStyle,
  bool readOnly = false,
  bool autofocus = false,
  TextStyle? style,
  StrutStyle? strutStyle,
  Color? colorSuffixIcon,
}) =>
    TextFormField(
      autofocus:autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      style: style,
      strutStyle:strutStyle ,
      cursorColor: cursorColor,
      toolbarOptions: toolbarOptions,
      obscureText: isPassword,
      controller: controller,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      
      
      decoration: InputDecoration(
        suffixIcon:
        IconButton(icon: Icon(suffixIcon,), onPressed: suffixPressed,color: colorSuffixIcon ,),
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        enabledBorder: enabledBorder,
        focusColor: focusColor,
        focusedBorder: focusedBorder,
        suffixStyle: suffixStyle,
        border:  OutlineInputBorder(borderRadius: BorderRadius.circular(25), ),
      ),
      onTap: onTap,
      validator: validator,

    );


Widget defaultTextButton(
    {required Function()? onPressed,
      required String title,
      TextStyle? style,
      bool isUpperCase = true,
    }) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        isUpperCase ? title.toUpperCase() : title,
        style: style,
      ),
    );