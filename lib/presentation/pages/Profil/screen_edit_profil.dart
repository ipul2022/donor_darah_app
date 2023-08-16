// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_element, avoid_web_libraries_in_flutter

import 'package:donor_darah/domain/model/district/district.dart';
import 'package:donor_darah/domain/model/village/village_data.dart';
import 'package:donor_darah/presentation/pages/BLOC/district/cubit/district_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/job/cubit/job_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/profile/cubit/profile_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/village/cubit/village_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:donor_darah/utility/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLOC/update_profile/cubit/update_profile_cubit.dart';

class ScreenEditProfil extends StatefulWidget {
  // final String fotProfile;
  // final String nama;
  // final String tempatLahir;
  // final String tanggalLahir;
  // final String jenisKelamin;
  // final String pekerjaan;
  // final String unitPMI;
  // final String noHp;
  // final String email;
  // final String alamat;
  // final String kecamatan;
  // final String kelurahan;
  // final String kodePos;
  const ScreenEditProfil({
    Key? key,
    // required this.fotProfile,
    // required this.nama,
    // required this.tempatLahir,
    // required this.tanggalLahir,
    // required this.jenisKelamin,
    // required this.pekerjaan,
    // required this.unitPMI,
    // required this.noHp,
    // required this.email,
    // required this.alamat,
    // required this.kecamatan,
    // required this.kelurahan,
    // required this.kodePos,
  }) : super(key: key);

  @override
  State<ScreenEditProfil> createState() => _ScreenEditProfilState();
}

TextEditingController imageController = TextEditingController();
TextEditingController namaController = TextEditingController();
TextEditingController tempatController = TextEditingController();
TextEditingController tanggalController = TextEditingController();
TextEditingController nohpController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController alamatController = TextEditingController();
TextEditingController posController = TextEditingController();

String? _jenisKelamin;
int? _jobSelected;
int? _unitPmiSelected;
DateTime? _selectedDate;
DistrictDataSelected? _districtDataSelected;
VillageData? _villageDataSelected;
String? _villageIdSelected;
String? _subDistrickIdSelected;

class _ScreenEditProfilState extends State<ScreenEditProfil> {
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(
        () {
          _selectedDate = pickedDate;
          tanggalController.text =
              "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
        },
      );
    }
  }

  @override
  void initState() {
    BlocProvider.of<JobCubit>(context).fetchJob();
    BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd();
    BlocProvider.of<DistrictCubit>(context).fetchDistrict();
    BlocProvider.of<VillageCubit>(context).fetchVillage(null);
    // namaController.text = widget.nama;
    // tempatController.text = widget.tempatLahir;
    // tanggalController.text = widget.tanggalLahir;
    // _jenisKelamin = widget.jenisKelamin;
    // _jobSelected = int.parse(widget.pekerjaan);
    // _unitPmiSelected = int.parse(widget.unitPMI);
    // _unitPmiSelected = int.parse(widget.unitPMI);
    // nohpController.text = widget.noHp;
    // emailController.text = widget.email;
    // alamatController.text = widget.alamat;
    // alamatController.text = widget.alamat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Simpan',
                style: TextStyle(fontSize: 16, color: redColor),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, updateState) {
            if (updateState is UpdateProfileIsFailed) {
              Commons().showSnackBarErrorr(
                context,
                updateState.message!,
              );
            } else if (updateState is UpdateProfileIsLoading) {
              const Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              );
            }
          },
          builder: (context, updateProfileState) {
            if (updateProfileState is UpdateProfileIsLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: redColor,
                ),
              );
            } else if (updateProfileState is UpdateProfileIsSucces) {
              return Container();
            } else {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/DD33.png",
                        height: 80,
                        width: 80,
                      ),
                    ),
                    //informasi Pribadi
                    const Text(
                      'Informasi Pribadi',
                      style: TextStyle(fontSize: 16),
                    ),
                    _InputText(
                      judulInput: 'Nama Lengkap',
                      controller: namaController,
                      texInputType: TextInputType.text,
                    ),
                    _InputText(
                      judulInput: 'Tempat Lahir',
                      controller: tempatController,
                      texInputType: TextInputType.text,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.only(top: 10),
                      dense: true,
                      title: const Text(
                        'Tanggal Lahir',
                        style: TextStyle(color: greyColor),
                      ),
                      subtitle: TextFormField(
                        maxLength: 9,
                        controller: tanggalController,
                        onTap: () {
                          selectDate(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Jenis Kelamin',
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: '1',
                            title: const Text('Laki-Laki'),
                            activeColor: redColor,
                            groupValue: _jenisKelamin,
                            onChanged: (value) {
                              setState(() {
                                _jenisKelamin = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            value: '2',
                            title: const Text('Perempuan'),
                            activeColor: redColor,
                            groupValue: _jenisKelamin,
                            onChanged: (value) {
                              setState(() {
                                _jenisKelamin = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Informasi Pekerjaan',
                      style: TextStyle(fontSize: 16),
                    ),
                    BlocBuilder<JobCubit, JobState>(
                      builder: (context, jobState) {
                        if (jobState is JobIsSucces) {
                          return Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffD4D4D4),
                                ),
                              ),
                            ),
                            child: DropdownButtonFormField(
                              hint: const Text('Pilih Pekerjaan'),
                              isExpanded: false,
                              value: _jobSelected,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              items: jobState.data!
                                  .map<DropdownMenuItem<int>>((data) {
                                return DropdownMenuItem<int>(
                                  value: data.id,
                                  child: Text(
                                    data.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _jobSelected = value;
                                print('JOB:${_jobSelected}');
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Informasi PMI',
                      style: TextStyle(fontSize: 16),
                    ),
                    BlocBuilder<UnitUddCubit, UnitUddState>(
                      builder: (context, unitState) {
                        if (unitState is UnitUddIsSuccess) {
                          return Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: Color(0xffD4D4D4),
                                ),
                              ),
                            ),
                            child: DropdownButtonFormField(
                              hint: const Text('Pilih UDD PMI'),
                              isExpanded: false,
                              value: _unitPmiSelected,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              items: unitState.data
                                  .map<DropdownMenuItem<int>>((data) {
                                return DropdownMenuItem<int>(
                                  value: data.id,
                                  child: Text(
                                    data.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _unitPmiSelected = value;
                                print('PMI:${_unitPmiSelected}');

                                // setState(() {
                                // });
                              },
                            ),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Informasi Kontak',
                      style: TextStyle(fontSize: 16),
                    ),
                    _InputText(
                      judulInput: 'Telepon / No Handphone',
                      controller: nohpController,
                      texInputType: TextInputType.number,
                    ),
                    _InputText(
                      judulInput: 'Email',
                      controller: nohpController,
                      texInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Informasi Alamat',
                      style: TextStyle(fontSize: 16),
                    ),
                    _InputText(
                      judulInput: 'Alamat KTP',
                      controller: alamatController,
                      texInputType: TextInputType.text,
                    ),
                    BlocBuilder<DistrictCubit, DistrictState>(
                      builder: (context, distickState) {
                        if (distickState is DistrictIsSucces) {
                          return ListTile(
                            contentPadding: const EdgeInsets.only(top: 20),
                            title: const Text(
                              'Kecamatan',
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                              ),
                            ),
                            subtitle: Container(
                              padding: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Color(0xffD4D4D4),
                                  ),
                                ),
                              ),
                              child: DropdownButtonFormField(
                                hint: const Text('Pilih Kecamatan'),
                                isExpanded: false,
                                value: _districtDataSelected,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                items: distickState.data.map((data) {
                                  return DropdownMenuItem<DistrictDataSelected>(
                                    value: DistrictDataSelected(
                                      id: data.id.toString(),
                                      code: '',
                                    ),
                                    child: Text(
                                      data.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _districtDataSelected =
                                        value as DistrictDataSelected;
                                    context.read<VillageCubit>().fetchVillage(
                                          _districtDataSelected!.code,
                                        );
                                    print(
                                      'DISTRICK CODE:${_districtDataSelected?.code}',
                                    );
                                  });
                                },
                              ),
                            ),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),

                    BlocBuilder<VillageCubit, VillageState>(
                      builder: (context, villageState) {
                        if (villageState is VillageIsSucces) {
                          return ListTile(
                            contentPadding: const EdgeInsets.only(top: 20),
                            title: const Text(
                              'Kelurahan',
                              style: TextStyle(
                                fontSize: 14,
                                color: greyColor,
                              ),
                            ),
                            subtitle: Container(
                              padding: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Color(0xffD4D4D4),
                                  ),
                                ),
                              ),
                              child: DropdownButtonFormField(
                                hint: const Text('Pilih Kelurahan'),
                                isExpanded: false,
                                value: _villageDataSelected,
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                items: villageState.data.map((data) {
                                  return DropdownMenuItem<VillageData>(
                                    value: data,
                                    child: Text(
                                      data.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _villageIdSelected = value!.id.toString();
                                    _subDistrickIdSelected =
                                        value.subDistrictId.toString();
                                    print('VillAGE ID:${_villageIdSelected}');
                                    print(
                                      'SUBDITRICT ID:${_subDistrickIdSelected}',
                                    );
                                  });
                                },
                              ),
                            ),
                          );
                        } else {
                          return const Text('');
                        }
                      },
                    ),

                    _InputText(
                      judulInput: 'Kode Pos',
                      controller: posController,
                      texInputType: TextInputType.number,
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _InputText extends StatelessWidget {
  final String judulInput;
  final TextInputType texInputType;
  final TextEditingController controller;
  const _InputText({
    Key? key,
    required this.judulInput,
    required this.texInputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 20),
          title: Text(
            judulInput,
            style: const TextStyle(fontSize: 12, color: greyColor),
          ),
          subtitle: TextFormField(
            controller: controller,
            keyboardType: texInputType,
          ),
        )
      ],
    );
  }
}

class DistrictDataSelected {
  final String id;
  final String code;
  DistrictDataSelected({
    required this.id,
    required this.code,
  });
}
