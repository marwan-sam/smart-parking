// import 'package:flutter/material.dart';
// import 'package:smart_parking/core/app_colors.dart';

// Widget AppTextFormField({
//   TextEditingController? controller,
//   TextStyle? styleTxt,
//   bool isPassword = false,
//   void Function(String)? onFieldSubmitted,
//   void Function(String)? savedValue,
//   Widget? perfixIconAddInRight,
//   Color? perfixColor,
//   Color? suffixColor,
//   Widget? suffixIconAddInLeft,
//   String? txtHint,
//   TextStyle? hintStyle,
//   Color colorBorderShowing = AppColors.colorLikeBlack,
//   // Color colorBorderFoucsedOn = AppColors.colorGrey,
//   Color colorBorderError = AppColors.colorLikeRed,
//   Color colorBorderGeneral = AppColors.colorLikeBlack,
//   Color backgroundColorField = AppColors.colorLikeBlack,
//   double radius = 10,
//   bool isNeedToCstValidate = false,
//   String? Function(String?)? validator,
//   void Function()? onTap,
//   FocusNode? focusNode,
//   String? initValue,
//   TextInputType? keyboardType,
//   Widget? label,
//   bool autofocus = false,
// }) =>
//     TextFormField(
//       keyboardType: keyboardType,
//       initialValue: initValue,
//       focusNode: focusNode,
//       onTap: onTap,
//       style: styleTxt,
//       obscureText: isPassword,
//       controller: controller,
//       onFieldSubmitted: onFieldSubmitted,
//       validator: isNeedToCstValidate
//           ? validator
//           : (data) {
//               if (data!.isEmpty) {
//                 return 'Value Not Must Empty !';
//               }
//               return null;
//             },
//       onChanged: savedValue,
//       autofocus: autofocus,
//       decoration: InputDecoration(
//         label: label,
//         labelStyle: styleTxt,
//         filled: true, //<-- SEE HERE
//         fillColor: backgroundColorField, //<-- SEE HERE
//         prefixIcon: perfixIconAddInRight,
//         prefixIconColor: perfixColor,
//         suffixIconColor: suffixColor,
//         suffixIcon: suffixIconAddInLeft,
//         hintText: txtHint,
//         hintStyle: hintStyle,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius),
//           borderSide: BorderSide(
//             color: colorBorderShowing,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius),
//           borderSide: const BorderSide(
//             color: AppColors.colorLikeGrey,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius),
//           borderSide: BorderSide(
//             color: colorBorderError,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius),
//           borderSide: BorderSide(
//             color: colorBorderGeneral,
//           ),
//         ),
//       ),
//     );
