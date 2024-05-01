class FeelingModel {
  int? id;
  String? kategori;

  FeelingModel({
    this.id,
    this.kategori,
  });

  FeelingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kategori'] = this.kategori;

    return data;
  }
}
