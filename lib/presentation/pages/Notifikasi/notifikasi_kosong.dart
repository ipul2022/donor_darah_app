// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';

class NotifikasiKosong extends StatefulWidget {
  const NotifikasiKosong({Key? key}) : super(key: key);

  @override
  State<NotifikasiKosong> createState() => _NotifikasiKosongState();
}

class _NotifikasiKosongState extends State<NotifikasiKosong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white249Color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage(
                "assets/images/DD41.png",
              ),
              height: 80,
              width: 85,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Belum ada notifikasi",
              style: TextStyle(
                fontFamily: "Plus Jakarta Sans",
                fontSize: 14,
                color: white204Color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
