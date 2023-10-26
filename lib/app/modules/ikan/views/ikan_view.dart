import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/app/data/model/ikan_model.dart';
import 'package:responsi/app/modules/ikan/bindings/ikan_api_services.dart';
import 'package:responsi/app/routes/app_pages.dart';

class IkanView extends StatelessWidget {
  const IkanView({super.key});

  @override
  Widget build(BuildContext context) {
    final IkanApiService api = IkanApiService();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 0,
        title: const Text("Kokofish"),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/ikanAdd');
              },
              icon: const Icon(CupertinoIcons.add))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Fish",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<Ikan>>(
                future: api.getAllFish(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("something went wrong");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final List<Ikan> ikans = snapshot.data!;
                    return ListView.builder(
                      itemCount: ikans.length,
                      itemBuilder: (context, index) {
                        final Ikan ikan = ikans[index];
                        return ikanTile(ikan);
                      },
                    );
                  } else {
                    return const Text("Tidak ada ikan disini");
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }

  Container ikanTile(Ikan ikan) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0.05),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.rectangle_rounded,
            color: Colors.black.withOpacity(0.15),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: Text(ikan.nama)),
          IconButton(
              onPressed: () {
                Get.toNamed('/ikanDetail', arguments: ikan);
              },
              icon: const Icon(CupertinoIcons.chevron_right))
        ],
      ),
    );
  }
}
