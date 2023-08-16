// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:donor_darah/presentation/pages/Home/bottom_navbar_screen.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_kosong.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../BLOC/notifikasi/cubit/notifikasi_cubit_dart_cubit.dart';
import '../BLOC/notifikasi/cubit/notifikasi_cubit_dart_state.dart';

class Notifikasidetail extends StatefulWidget {
  const Notifikasidetail({Key? key}) : super(key: key);

  @override
  State<Notifikasidetail> createState() => _NotifikasidetailState();
}

bool isOpen = false;

class _NotifikasidetailState extends State<Notifikasidetail> {
  @override
  void initState() {
    BlocProvider.of<NotifikasiCubit>(context).fetchNotifikasi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        elevation: 0,
        toolbarHeight: height * 0.13,
        titleSpacing: width * 0.1,
        title: Text(
          'Notifikasi',
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Image.asset(
              'assets/images/DD16.png',
              height: height * 0.1,
              width: width * 0.18,
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotifikasiCubit, NotifikasiState>(
        builder: (context, state) {
          if (state is NotifikasiIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (state is NotifikasiIsSucces) {
            if (state.data.isEmpty) {
              return const NotifikasiKosong();
            } else {
              return Container(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (isOpen ? white249Color : pinkColor),
                        boxShadow: [
                          BoxShadow(
                            color: (isOpen ? white249Color : pinkColor),
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.go('/jadwaldonordarah');
                            },
                            child: Text(
                              "Jadwal Donor Darah",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: redColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Anda memiliki jadwal donor darah selanjutnya pada ",
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 12,
                                    fontFamily: "Plus Jakarta Sans",
                                    color: greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: "23 Januari 2023. ",
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 12,
                                    fontFamily: "Plus Jakarta Sans",
                                    color: redColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "Mohon untuk segera mengajukan donor darah dan ber...",
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 12,
                                    fontFamily: "Plus Jakarta Sans",
                                    color: greyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          } else if (state is NotifikasiIsFailed) {
            return Center(
              child: Text('${state.message}'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
