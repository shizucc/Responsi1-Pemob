import 'package:get/get.dart';
import 'package:responsi/app/data/model/ikan_model.dart';
import 'package:responsi/app/modules/ikan/bindings/ikan_api_services.dart';

class IkanController extends GetxController {
  Future<bool> save(
      String nama, String jenis, String warna, String habitat) async {
    final Map<String, dynamic> body = {
      "nama": nama,
      "jenis": jenis,
      "warna": warna,
      "habitat": habitat
    };

    final result = await IkanApiService().saveIkan(body);
    return result;
  }

  Future<dynamic> updateIkan(String id, String nama, String jenis, String warna,
      String habitat) async {
    final Map<String, dynamic> body = {
      "nama": nama,
      "jenis": jenis,
      "warna": warna,
      "habitat": habitat
    };
    final result = await IkanApiService().updateIkan(body, id);
    return result;
  }

  Future<dynamic> deleteIkan(String id) async {
    final result = await IkanApiService().deleteIkan(id);
    return result;
  }
}
