import 'package:flutter/material.dart';

class FormComponent extends StatelessWidget {
  final double? width;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? hintText;
  final TextInputType textInputType;
  final String? errorText;
  final bool enabled;
  final bool isDense;
  final bool filled;
  final Function(String)? onSaved;
  bool obscureText;
  final Function()? onTap;
  final Icon? icon;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final Function(String)? onChanged;

  FormComponent({
    super.key,
    this.controller,
    this.textInputAction=TextInputAction.next,
    this.hintText,
    this.isDense = false,
    this.filled  = true,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.errorText,
    this.onSaved,
    this.enabled = true,
    this.width,
    this.icon,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context)  {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(MediaQuery.textScaleFactorOf(context)*3),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
        enabled: enabled,
        obscureText: obscureText,
        textInputAction: textInputAction,
        textAlign: TextAlign.start,
        maxLines: 1,

        keyboardType: textInputType,
        maxLength: 40,
          style: TextStyle(fontSize: 15,color: Colors.black),
          decoration: InputDecoration(
          hoverColor: Color(0xfffe504f),
          prefixIcon: prefixIcon ,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(10),
          icon: icon,
          isDense: isDense,
          filled: filled,
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          errorText: errorText,

          counterText: "",
          hintStyle: TextStyle(fontSize: 15,color: Colors.black),
          border: InputBorder.none,

            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}

