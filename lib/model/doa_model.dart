class DoaModel {
  int? id;
  String? foto;
  String? title;
  String? waktu;
  String? doa;

  DoaModel({
    this.id,
    this.foto,
    this.title,
    this.waktu,
    this.doa
  });

  DoaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foto = json['foto'];
    title = json['title'];
    waktu = json['waktu'];
    doa = json['doa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foto'] = this.foto;
    data['title'] = this.title;
    data['waktu'] = this.waktu;
    data['doa'] = this.doa;
    return data;
  }
}
