import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/app/data/model/ikan_model.dart';
import 'package:responsi/app/modules/ikan/controller/ikan_controller.dart';

class IkanDetail extends StatelessWidget {
  const IkanDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(IkanController());
    titleTextStyle() {
      return TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
    }

    detailTextStyle() {
      return TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7));
    }

    final Ikan ikan = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Ikan",
                style: titleTextStyle(),
              ),
              Text(
                ikan.nama,
                style: detailTextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Jenis Ikan",
                style: titleTextStyle(),
              ),
              Text(ikan.jenis, style: detailTextStyle()),
              SizedBox(
                height: 10,
              ),
              Text(
                "Warna Ikan",
                style: titleTextStyle(),
              ),
              Text(
                ikan.warna,
                style: detailTextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Habitat Ikan",
                style: titleTextStyle(),
              ),
              Text(
                ikan.habitat,
                style: detailTextStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/ikanEdit', arguments: ikan);
                      },
                      child: Text("Edit")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        c.deleteIkan(ikan.id).then((value) {
                          if (value) {
                            Get.toNamed('/ikanView');
                          }
                        });
                      },
                      child: Text("Delete")),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
