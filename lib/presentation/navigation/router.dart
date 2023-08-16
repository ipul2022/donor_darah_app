part of 'package.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splashScreen,
      builder: (context, state) => const SplashScreen(),
      redirect: (context, state) async {
        final isAuth = context.read<AuthCubit>().checkToken();
        if (await isAuth) {
          return '/home-screen';
        } else {
          return '/login';
        }
      },
    ),
    GoRoute(
      path: '/login',
      name: Routes.loginPage,
      builder: (context, state) {
        return const LoginPage();
      },
      routes: [
        GoRoute(
          path: "register",
          name: Routes.screenReg,
          builder: (context, state) {
            return const ScreenRegister();
          },
          routes: [
            GoRoute(
              path: "step2",
              name: Routes.screenRegA,
              builder: (context, state) {
                return const ScreenRegisterAlamat();
              },
              routes: [
                GoRoute(
                  path: "step3",
                  name: Routes.screenRegS,
                  builder: (context, state) {
                    return const ScreenRegisterSandi();
                  },
                )
              ],
            )
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home-screen',
      name: Routes.homeScreen,
      builder: (context, state) {
        return const BottomNavbarScreen(body: HomeScreen());
      },
      routes: [
        //Jadwal donor routes
        GoRoute(
          path: 'udd-screen',
          name: Routes.uddPage,
          builder: (context, state) {
            return const UddPage(stockDarah: false);
          },
          routes: [
            GoRoute(
              path: 'jadwal-donor',
              name: Routes.jadwalDonorPage,
              builder: (context, state) {
                return const JadwalDonorPage();
              },
              routes: [
                GoRoute(
                  path: 'detail-jadwal-donor',
                  name: Routes.detailJadwalPage,
                  builder: (context, state) {
                    return const DetailJadwalPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'questionaire',
                      name: Routes.questionerPage,
                      builder: (context, state) => const QuestionairePage(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        //Stock Darh routes
        GoRoute(
          path: "udd-stockdarah-screen",
          name: Routes.uddStockDarahScreen,
          builder: (context, state) => const UddPage(stockDarah: true),
          routes: [
            GoRoute(
              path: "stokdarah",
              name: Routes.screenstokdarah,
              builder: (context, state) {
                int? unitId;
                if (state.extra is int) {
                  unitId = state.extra as int;
                }
                BlocProvider.of<StockDarahCubit>(context).fetchStockDarah(
                  unitId: unitId ?? 0,
                );
                BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
                return ScreenStokDarah(
                  unitId: unitId ?? 0,
                );
              },
              routes: [
                GoRoute(
                  path: "stokdarahA",
                  name: Routes.screenstokdarahA,
                  builder: (context, state) {
                    Map<String, dynamic> data =
                        state.extra as Map<String, dynamic>;
                    BlocProvider.of<DetailStockDarahCubit>(context)
                        .fetchDetailStock(id: data['id'] ?? 0);
                    return ScreenStokDarahA(
                      tittle: data['tittle'] ?? '',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/agenda-screen',
      name: Routes.agendaScreen,
      builder: (context, state) {
        return const BottomNavbarScreen(body: AgendaScreen());
      },
      routes: [
        GoRoute(
          path: "agenda-detail-screen",
          name: Routes.agendaDetailScreen,
          builder: (context, state) {
            String idAgenda = state.extra as String;
            return DetailAgendaScreen(idAgenda: idAgenda);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/notifikasi-detail-screen',
      name: Routes.notifikasiDetailScreen,
      builder: (context, state) =>
          const BottomNavbarScreen(body: Notifikasidetail()),
    ),
    GoRoute(
      path: "/profile-screen",
      name: Routes.profileScreen,
      builder: (context, state) {
        BlocProvider.of<ProfileCubit>(context).fetchProfile();
        return const BottomNavbarScreen(body: ProfileScreen());
      },
      routes: [
        GoRoute(
          path: "editprofil",
          name: Routes.screeneditprofil,
          builder: (context, state) => const ScreenEditProfil(),
        ),
        GoRoute(
          path: "riwayatdonor",
          name: Routes.screenriwayatdonor,
          builder: (context, state) {
            return const ScreenRiwayatDonor();
          },
          routes: [
            GoRoute(
              path: "lihat-bukti-donor-screen",
              name: Routes.lihatBuktiDonorScreen,
              builder: (context, state) {
                return const ScreenBuktiDonor();
              },
            ),
            GoRoute(
              path: "upload-bukti-donor-screen",
              name: Routes.uploadBuktiDonorScreen,
              builder: (context, state) {
                Map<String, dynamic> data = state.extra as Map<String, dynamic>;
                return ScreenUploadBuktiDonor(
                  image: data['image'] as File,
                  idRiwayat: data['idRiwayat'] as String,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "kartudonor",
          name: Routes.screenkartudonor,
          builder: (context, state) {
            BlocProvider.of<KartuDonorCubit>(context).fetchKartuDonor();
            return const ScreenKartuDonor();
          },
        ),
      ],
    ),
    GoRoute(
      path: "/reschedule-screen",
      name: Routes.rescheduleScreen,
      builder: (context, state) {
        Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return RescheduleDonorScreen(
          idAgenda: data['idAgenda'],
          idUnit: data['idUnit'],
        );
      },
    ),
    GoRoute(
      path: "/akun",
      name: Routes.screenakun,
      builder: (context, state) => const ScreenAkun(),
    ),
    GoRoute(
      path: "/jadwaldonordarah",
      name: Routes.responsenotif,
      builder: (context, state) => const ResponseNotif(),
    ),
    GoRoute(
      path: "/ubahsandi",
      name: Routes.screenubahsandi,
      builder: (context, state) => const ScreenUbahSandi(),
    ),
    GoRoute(
      path: "/notifkosong",
      name: Routes.notifikasik,
      builder: (context, state) => const NotifikasiKosong(),
    ),
    GoRoute(
      path: "/berita",
      name: Routes.detailinfoberita,
      builder: (context, state) => const DetailInfoBerita(),
    ),
    GoRoute(
      path: '/lupa-password',
      name: Routes.lupaPasswordPage,
      builder: (context, state) => const LupaPasswordPage(),
    ),
  ],
);
