import 'dart:convert';

class Ikan {
  String id;
  String nama;
  String jenis;
  String warna;
  String habitat;

  Ikan(
      {required this.id,
      required this.nama,
      required this.jenis,
      required this.warna,
      required this.habitat});

  factory Ikan.fromJson(Map<String, dynamic> json) => Ikan(
      id: json['id'] as String,
      nama: json['nama'] as String,
      jenis: json['jenis'] as String,
      warna: json['warna'] as String,
      habitat: json['habitat'] as String);

  Map<String, dynamic> toJson() =>
      {"nama": nama, "jenis": jenis, "warna": warna, "habitat": habitat};
}
