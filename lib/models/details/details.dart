class UserDetalils {
  String? displaiyName;
  String? email;
  String? photoUrl;

  UserDetalils({this.displaiyName, this.email, this.photoUrl});

  UserDetalils.fromJson(Map<String, dynamic> json){
    displaiyName = json['displaiyName'];
    photoUrl = json['displaiyName'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displaiyName'] = this.displaiyName;
    data['photoUrl'] = this.photoUrl;
    data['email'] = this.email;

    return data;
  }
}