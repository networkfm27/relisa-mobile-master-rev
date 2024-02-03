import 'dart:convert';

class Event {
    final int? id;
    final String? name;
    final int? categoryId;
    final String? slug;
    final String? ketentuan;
    final String? poster;
    final DateTime? tanggal;
    final String? deskripsi;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Event({
        this.id,
        this.name,
        this.categoryId,
        this.slug,
        this.ketentuan,
        this.poster,
        this.tanggal,
        this.deskripsi,
        this.createdAt,
        this.updatedAt,
    });

    factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        slug: json["slug"],
        ketentuan: json["ketentuan"],
        poster: json["poster"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        deskripsi: json["deskripsi"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "slug": slug,
        "ketentuan": ketentuan,
        "poster": poster,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "deskripsi": deskripsi,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}