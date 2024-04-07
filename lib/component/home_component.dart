import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class HomeComponent extends StatelessWidget {
  final String? valueText;
  final String? text;
  final IconData? icon;

  const HomeComponent({
    Key? key,
    this.text,
    this.valueText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextLabelComponent(text: valueText),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(width: 5),
              TextComponent(
                text: text,
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeFastComponent extends StatelessWidget {
  final String? valueText;
  final String? text;
  final IconData? icon;
  final TextEditingController? controller;

  const HomeFastComponent({
    Key? key,
    this.text,
    this.valueText,
    this.icon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            maxLines: 1,
            keyboardType: TextInputType.number,
            maxLength: 40,
            style: TextStyle(fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
              hoverColor: Color(0xfffe504f),
              contentPadding: const EdgeInsets.all(10),
              fillColor: Colors.grey.shade100,
              hintText: valueText,
              counterText: "",
              hintStyle: TextStyle(fontSize: 25, color: Colors.black),
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
          SizedBox(height: 5),
          TextComponent(
            text: text,
            textStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
