// import 'package:flutter/material.dart';
// import 'package:smart_parking/core/app_colors.dart';
// import 'package:smart_parking/core/helper/app_device_info.dart';
// import 'package:smart_parking/core/app_style.dart';

// Widget AppButton(
//   BuildContext context, {
//   required String text,
//   TextStyle? textStyle,
//   IconData? iconBeforeText,
//   Color? bgColor,
//   Color? colorTxt,
//   double? width,
//   double? radius,
//   void Function()? onTap,
// }) =>
//     GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//         decoration: BoxDecoration(
//           color: bgColor ?? AppColors.colorLikeBlack,
//           borderRadius: BorderRadius.circular(radius ?? 10),
//         ),
//         width: width ??
//             AppDevInfo().si(context).width -
//                 AppDevInfo().si(context).width * 0.06,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: iconBeforeText == null ? 0 : 4.0),
//               child: Icon(
//                 iconBeforeText,
//                 size: 20,
//               ),
//             ),
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: textStyle ??
//                   AppStyles.forTextAnyButton.copyWith(color: colorTxt),
//             ),
//           ],
//         ),
//       ),
//     );
