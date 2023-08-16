// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/repository/kartu_donor/kartu_donor_repository_impl.dart';
import '../../navigation/routes.dart';
import '../BLOC/kartu_donor/cubit/kartu_donor_cubit.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';

class ScreenKartuDonor extends StatefulWidget {
  const ScreenKartuDonor({super.key});

  @override
  State<ScreenKartuDonor> createState() => _ScreenKartuDonorState();
}

class _ScreenKartuDonorState extends State<ScreenKartuDonor> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Kartu Donor Darah',
          style: TextStyle(
            fontSize: width * 0.03,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<KartuDonorCubit, KartuDonorState>(
        builder: (context, kartuDonorState) {
          if (kartuDonorState is KartuDonorIsLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: redColor,
              ),
            );
          } else if (kartuDonorState is KartuDonorIsSucces) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(24, 29, 24, 0),
              child: Column(
                children: [
                  Container(
                    height: height * 0.2,
                    width: width,
                    decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kartu Donor Darah",
                                style: CustomStyle2491(),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "${kartuDonorState.data.name}",
                                overflow: TextOverflow.ellipsis,
                                style: CustomStyle2493(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${kartuDonorState.data.date}",
                                style: CustomStyle2494(),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "${kartuDonorState.data.id}",
                                style: CustomStyle2495(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipPath(
                              clipper: ClipClass(),
                              child: Container(
                                height: 160,
                                width: MediaQuery.of(context).size.width / 2.60,
                                decoration: const BoxDecoration(
                                    color: white249Color,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                              "assets/images/DD66.png",
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Image.asset("assets/images/QR Code.png"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${kartuDonorState.data.idDonor}",
                                      style: CustomStyle01(),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/DD343.png"),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Image.asset("assets/images/DD67.png"),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Image.asset("assets/images/DD65.png"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: redColor,
                        fixedSize: Size(width, height * 0.06)),
                    child: Text(
                      "Unduh Kartu Donor",
                      style: CustomStyle2493(),
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: Text("Data Not Found"),
          );
        },
      ),
    );
  }
}

class ClipClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    Path path0 = Path();
    path0.moveTo(size.width * 0.1500000, size.height * 0);
    path0.quadraticBezierTo(size.width * -0.0691111, size.height * 0.5133125,
        size.width * 0.1500000, size.height * 0.9875000);
    path0.lineTo(w * 0.1500000, h);
    path0.lineTo(w, h);
    path0.lineTo(w, 0);
    path0.close();
    // path0.moveTo(w * 0.08, h * 0);
    // path0.quadraticBezierTo(
    //     w * 0.0616250, h * 0.5059200, w * 0.3087500, h * 0.9940000);
    // path0.lineTo(w * 0.08, h);
    // path0.lineTo(w, h);
    // path0.lineTo(w, 0);

    // path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
