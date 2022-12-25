// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:supabase_hackathon/constants/constant.dart';

// class TextFieldContainer extends StatelessWidget {
//   final controller;
//   final hintText;
//   final hintStyle;
//   const TextFieldContainer(
//       {super.key,
//       required this.controller,
//       required this.hintText,
//       this.hintStyle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: primaryColor),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       child: TextField(
//         controller: controller,
//         style: const TextStyle(
//           color: Colors.grey,
//           fontSize: 14,
//         ),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: hintText,
//           hintStyle: hintStyle,
//         ),
//       ),
//     );
//   }
// }
