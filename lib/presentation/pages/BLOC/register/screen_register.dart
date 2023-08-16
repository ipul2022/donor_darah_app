// // ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, avoid_unnecessary_containers

// import 'package:donor_darah/utility/commons.dart';
// import 'package:donor_darah/utility/commonss.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import '../../../../../data/repository/register/register_repository_impl.dart';
// import 'register_bloc.dart';
// import 'register_state.dart';

// // ignore: unused_import

// // ignore: camel_case_types
// class RegScreen extends StatefulWidget {
//   const RegScreen({super.key});

//   @override
//   State<RegScreen> createState() => _RegScreen();
// }

// // ignore: camel_case_types
// class _RegScreen extends State<RegScreen> {
//   final _emailController = TextEditingController();
//   final _passController = TextEditingController();
//   final _namaController = TextEditingController();
//   bool isAgree = false;
//   bool hidePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: false,
//       body: BlocListener<RegisterCubit, RegisterState>(
//         listener: (context, registerState) {
//           if (registerState is RegisterIsFailed) {
//             //show snackbar
//             Commonss().showSnackBarInfo2(context, registerState.message!);
//           } else if (registerState is RegisterIsSucces) {
//             print("Registrasi Berhasil");
//             context.go('/dasboard');
//           }
//         },
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(left: 24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(66, 43, 90, 0),
//                   child: Image(image: AssetImage("assets/images/DD37.png")),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 215),
//                   child: Text(
//                     "Selamat Datang",
//                     style: TextStyle(
//                         color: Color.fromARGB(80, 15, 10, 1),
//                         fontSize: 16,
//                         fontFamily: "plus jakarta sans",
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 105),
//                   child: Text(
//                     "Silahkan Registrasi Dahulu",
//                     style: TextStyle(
//                         color: Color.fromARGB(80, 15, 10, 1),
//                         fontSize: 12,
//                         fontFamily: "plus jakartas sans",
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 32,
//                 ),
//                 Container(
//                   child: Text("Nama",
//                       style: TextStyle(
//                           color: Color.fromRGBO(217, 30, 42, 1),
//                           fontSize: 12,
//                           fontFamily: "plus jakarta sans",
//                           fontWeight: FontWeight.w600)),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 28),
//                   height: 48,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: Color.fromRGBO(252, 233, 234, 1),
//                     boxShadow: const [
//                       BoxShadow(
//                         offset: Offset(0, 0),
//                         blurRadius: 0,
//                       ),
//                     ],
//                   ),
//                   alignment: Alignment.center,
//                   child: TextField(
//                     controller: _namaController,
//                     obscureText: hidePassword,
//                     cursorColor: Colors.black,
//                     decoration: InputDecoration(
//                       hintText: "Masukkan Nama",
//                       hintStyle: TextStyle(
//                           color: Color.fromRGBO(179, 179, 179, 1),
//                           fontSize: 12,
//                           fontFamily: "plus jakarta sans"),
//                       contentPadding: EdgeInsets.fromLTRB(14, 16, 60, 16),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Container(
//                   child: Text("Email",
//                       style: TextStyle(
//                           color: Color.fromRGBO(217, 30, 42, 1),
//                           fontSize: 12,
//                           fontFamily: "plus jakarta sans",
//                           fontWeight: FontWeight.w600)),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 28),
//                   height: 48,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: Color.fromRGBO(252, 233, 234, 1),
//                     boxShadow: const [
//                       BoxShadow(
//                         offset: Offset(0, 0),
//                         blurRadius: 0,
//                       ),
//                     ],
//                   ),
//                   alignment: Alignment.center,
//                   child: TextField(
//                     obscureText: hidePassword,
//                     controller: _emailController,
//                     cursorColor: Color.fromRGBO(252, 233, 234, 1),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(14, 16, 60, 16),
//                       hintText: "Masukan Email",
//                       hintStyle: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(179, 179, 179, 1),
//                           fontFamily: "plus jakarta sans"),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Container(
//                   child: Text("Kata Sandi",
//                       style: TextStyle(
//                           color: Color.fromRGBO(217, 30, 42, 1),
//                           fontSize: 12,
//                           fontFamily: "plus jakarta sans",
//                           fontWeight: FontWeight.w600)),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 28),
//                   height: 48,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: Color.fromRGBO(252, 233, 234, 1),
//                     boxShadow: const [
//                       BoxShadow(
//                         offset: Offset(0, 0),
//                         blurRadius: 0,
//                       ),
//                     ],
//                   ),
//                   alignment: Alignment.center,
//                   child: TextField(
//                     obscureText: hidePassword,
//                     controller: _passController,
//                     cursorColor: Color.fromRGBO(252, 233, 234, 1),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(14, 16, 60, 16),
//                       hintText: "Masukan Kata Sandi",
//                       hintStyle: TextStyle(
//                           fontSize: 12,
//                           color: Color.fromRGBO(179, 179, 179, 1),
//                           fontFamily: "plus jakarta sans"),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       suffixIcon: IconButton(
//                           onPressed: () {
//                             if (hidePassword) {
//                               setState(() {
//                                 hidePassword = false;
//                               });
//                             } else {
//                               setState(() {
//                                 hidePassword = true;
//                               });
//                             }
//                           },
//                           icon: (hidePassword == true
//                               ? Icon(Icons.visibility_off, color: Colors.red)
//                               : Icon(
//                                   Icons.remove_red_eye,
//                                   color: Colors.red,
//                                 ))),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                       margin: EdgeInsets.only(right: 24),
//                       padding: EdgeInsets.only(left: 65, right: 65),
//                       alignment: Alignment.center,
//                       height: 48,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         color: Color.fromRGBO(217, 30, 42, 1),
//                       ),
//                       child: const Text(
//                         "Daftar",
//                         style: TextStyle(
//                           color: Color.fromRGBO(249, 249, 249, 1),
//                           fontSize: 16,
//                           fontFamily: "plus jakarta sans",
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
