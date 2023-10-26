import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/app/modules/ikan/controller/ikan_controller.dart';
import 'package:responsi/app/widgets/warning_dialog.dart';

class IkanAdd extends StatelessWidget {
  const IkanAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(IkanController());
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController namaController = TextEditingController();
    TextEditingController jenisController = TextEditingController();
    TextEditingController warnaController = TextEditingController();
    TextEditingController habitatController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.clear),
          onPressed: () {
            Get.back();
          },
        ),
        title: Center(child: Text("Add New Fish")),
        actions: [
          IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  c
                      .save(
                          namaController.value.text,
                          jenisController.value.text,
                          warnaController.value.text,
                          habitatController.value.text)
                      .then((value) {
                    if (value) {
                      Get.offNamed('/ikanView');
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const WarningDialog(
                            description: "Ikan tidak Tersimpan",
                          );
                        },
                      );
                    }
                  });
                }
              },
              icon: Icon(CupertinoIcons.check_mark))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _textFormField(namaController, "Nama"),
                      _textFormField(jenisController, "Jenis"),
                      _textFormField(warnaController, "Warna"),
                      _textFormField(habitatController, "Habitat"),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textFormField(
      TextEditingController namaController, String label) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "$label tidak boleh kosong";
        }
        return null;
      },
      controller: namaController,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
