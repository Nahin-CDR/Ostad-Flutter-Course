import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/utility/asset_manager.dart';
import 'package:task_manager/utility/colorManager.dart';

TextStyle head1Text({required Color textColor}){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700
  );
}
TextStyle head6Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w400
  );
}
TextStyle head5Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 14,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}
TextStyle head4Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 12,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}
InputDecoration appInputDecoration({required String label}){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.colorGreen
      ),
    ),
    fillColor: ColorManager.colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20,10,10,20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.colorWhite)
    ),
    border: const OutlineInputBorder(),
    labelText: label
  );
}
DecoratedBox appDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(
        color: ColorManager.colorWhite,
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: child,
    ),
  );
}
SvgPicture screenBackground(context){
  return SvgPicture.asset(
    AssetManager.screenBack,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}
ButtonStyle appStatusButtonStyle(btnColor){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
  );
}
TextStyle buttonTextStyle(){
  return const TextStyle(
      fontSize: 14,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}
Ink successButtonChild(String buttonText){
  return  Ink(
    decoration: BoxDecoration(
        color: ColorManager.colorGreen,
        borderRadius: BorderRadius.circular(6)
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child:Text(buttonText,style: buttonTextStyle()),
    ),
  );
}
Container statusChild(statusText,statusColor){
  return  Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: statusColor,
    ),
    height: 20,
    width: 60,
    child: Text(
        statusText,
        style: const TextStyle(
            color: ColorManager.colorWhite,
            fontSize: 10,
            fontWeight: FontWeight.w400
        )
    ),
  );
}
ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}
PinTheme appOtpStyle(){
  return PinTheme(
    inactiveColor: ColorManager.colorLight,
    inactiveFillColor: ColorManager.colorWhite,
    selectedFillColor: ColorManager.colorGreen,
    activeColor: ColorManager.colorWhite,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white
  );
}

SizedBox itemSizedBox(child){
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding:const EdgeInsets.all(10),
      child: child,
    ),
  );
}


