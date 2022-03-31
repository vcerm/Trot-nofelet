// import 'package:flutter/material.dart';
//
// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);
//
//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }
//
// class _AuthPageState extends State<AuthPage> {
//   @override
//   Widget build(BuildContext context) {
//
//     Widget _input(TextEditingController controller, bool obscure){
//       return Container(
//         child: TextField(
//           decoration: const InputDecoration(
//             fillColor: Color(0xffecd9cc),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xc4d4b59f), width: 1)
//             ),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xffD4B59F), width: 3)
//             ),
//           ),
//           controller: controller,
//           obscureText: obscure,
//           style: const TextStyle(
//             fontSize: 16,
//           ),
//         ),
//       );
//     }
//
//     Widget _form(String label, void func()){
//       return Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.zero,
//               child: _input(controller, true),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: const Color(0xffebddd3),
//       appBar: AppBar(
//         title: const Text(
//           'Трот-нофелет',
//           style: TextStyle(
//             fontSize: 24.0,
//             color: Color(0xffebddd3),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xff7d5538),
//         shadowColor: Colors.transparent,
//       ),
//       body: Column(
//         children: <Widget>[
//           _form(),
//         ],
//       ),
//     );
//   }
// }
//
