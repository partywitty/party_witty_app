import 'package:flutter/material.dart';
import 'style.dart';

InputDecoration inputDecoration(BuildContext context, {Widget? prefixIcon, String? hint,suffixIcon}){
  return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      hintText: hint,
      fillColor: const Color(0xFF434445),
      hintStyle: textHint,
      contentPadding: const EdgeInsets.all(14),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF434445),width: 1.0),
        borderRadius: BorderRadius.circular(25.7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF434445),width: 1),
        borderRadius: BorderRadius.circular(25.7),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.7),
          borderSide: const BorderSide(width: 1,color: Color(0xFF434445),),
          gapPadding: 0)
  );
}

InputDecoration inputDecorationTime(BuildContext context, {Widget? prefixIcon, String? hint,suffixIcon}){
  return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      hintText: hint,
      fillColor: Colors.grey,
      hintStyle: textHint,
      contentPadding: const EdgeInsets.all(2),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey,width: 1.0),
        borderRadius: BorderRadius.circular(5.7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey,width: 1),
        borderRadius: BorderRadius.circular(5.7),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.7),
          borderSide: const BorderSide(width: 1,color: Colors.grey),
          gapPadding: 0)
  );
}

InputDecoration inputDecorationSuffix(BuildContext context, {Widget? prefixIcon, String? hint,suffixIcon}){
  return InputDecoration(
      prefixIcon: prefixIcon,
      filled: true,
      hintStyle: textHint,
      hintText: hint,
      contentPadding: const EdgeInsets.only(
          left: 25.0, bottom: 12.0, top: 0.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
        borderRadius: BorderRadius.circular(25.7),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
        borderRadius: BorderRadius.circular(25.7),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.7),
          borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
  );
}

BoxDecoration boxDecoration(){
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset(0.1, 0.1),
      end: FractionalOffset(0.7, 0.1),
      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
    ),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  );
}

BoxDecoration boxDecorationSquare(){
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset(0.1, 0.1),
      end: FractionalOffset(0.7, 0.1),
      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
    ),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  );
}

InputDecoration whiteDecoration(BuildContext context, {Widget? prefixIcon, String? hint,suffixIcon}){
  return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.only(
          left: 25.0, bottom: 12.0, top: 0.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
  );
}

// artist-profile
