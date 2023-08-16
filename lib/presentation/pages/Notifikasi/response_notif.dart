import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repository/notifikasi/notifikasi_repository_impl.dart';
import '../BLOC/notifikasi/cubit/notifikasi_detail_cubit.dart';

class ResponseNotif extends StatefulWidget {
  const ResponseNotif({Key? key}) : super(key: key);

  @override
  State<ResponseNotif> createState() => _ResponseNotifState();
}

class _ResponseNotifState extends State<ResponseNotif> {
  late NotifikasiDetailCubit _notifikasiDetailCubit;

  @override
  void initState() {
    _notifikasiDetailCubit = NotifikasiDetailCubit(
      NotifikasiRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _notifikasiDetailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white249Color,
      body: BlocConsumer<NotifikasiDetailCubit, NotifikasiDetailState>(
        listener: (context, notifikasiDetailState) {
          if (notifikasiDetailState is NotifikasiDetailIsFailed) {
            Commons()
                .showSnackBarErrorr(context, notifikasiDetailState.message!);
          }
        },
        builder: (context, notifikasiDetailState) {
          if (notifikasiDetailState is NotifikasiDetailIsLoading) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          } else if (notifikasiDetailState is NotifikasiDetailIsSucces) {}
          {
            return Stack(
              children: [
                Positioned(
                    child: Container(
                  padding: const EdgeInsets.only(top: 28, left: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Notifikasi",
                        style: TextStyle(
                            wordSpacing: 1,
                            fontSize: 16,
                            fontFamily: "Plus Jakarta Sans",
                            color: white249Color,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(padding: EdgeInsets.only(left: 161)),
                      Image(image: AssetImage("assets/images/DD16.png"))
                    ],
                  ),
                )),
                Column(
                  children: [
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                          )
                        ],
                        color: white249Color,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 27,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(top: 31),
                                      child: GestureDetector(
                                        onTap: () => context.go('/'),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      )),
                                ],
                              )
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jadwal Donor Darah",
                                style: CustomStyle265(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: const TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text:
                                      "Anda memiliki jadwal donor darah selanjutnya pada ",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      fontSize: 10,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: greyColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: "23 Januari 2023. ",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      fontSize: 10,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: black26Color,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text:
                                      "Mohon untuk segera mengajukan donor darah dan berpartisipasi dalam kegiatan donor darah tersebut.",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      fontSize: 10,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: greyColor,
                                      fontWeight: FontWeight.w500),
                                )
                              ])),
                              const SizedBox(
                                height: 6,
                              ),
                              GestureDetector(
                                onTap: () => context.go('/notifkosong'),
                                child: const Text(
                                  "Ajukan Donor Darah Sekarang",
                                  style: TextStyle(
                                      wordSpacing: 1,
                                      fontSize: 10,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: redColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ])),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
