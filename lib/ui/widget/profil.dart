import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_piggy_app/controllers/profil_controller.dart';
import 'package:my_piggy_app/models/profil.dart';
import 'package:my_piggy_app/ui/theme.dart';

import 'add_profil.dart';

class profilHeader extends StatelessWidget {
  final Profil? profilModel;
  profilHeader({super.key, this.profilModel});

  final ProfilController controller = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
        id: 'header/profile',
        builder: (ProfilController controller) {
          return Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.only(top: 20.0),
              decoration: const BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      height: 90.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('images/profil.jpg')),
                      ),
                    ),
            Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 80),
                        ),
                        Builder(builder: (context) {
                          final profileData = controller.profilList;
                          return Column(
                            children: [
                              Text(profileData.isEmpty
                                  ? 'Nama Peternak'
                                  : profileData.first.namaPeternak ?? ""),
                              Text(profileData.isEmpty
                                  ? 'Nama Peternakan'
                                  : profileData.first.namaPeternakan ?? ""),
                            ],
                          );
                        }
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => const editProfil());
                  },
                          icon: const Icon(
                            Icons.edit_square,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ]));
        });
  }
}
