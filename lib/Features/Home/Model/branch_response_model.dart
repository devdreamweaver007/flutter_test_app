class BranchResponseModel {
  bool? status;
  String? message;
  List<MyBranch>? branches;

  BranchResponseModel({this.status, this.message, this.branches});

  BranchResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['branches'] != null) {
      branches = <MyBranch>[];
      json['branches'].forEach((v) {
        branches!.add(new MyBranch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.branches != null) {
      data['branches'] = this.branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyBranch {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  MyBranch(
      {this.id,
      this.name,
      this.patientsCount,
      this.location,
      this.phone,
      this.mail,
      this.address,
      this.gst,
      this.isActive});

  MyBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    patientsCount = json['patients_count'];
    location = json['location'];
    phone = json['phone'];
    mail = json['mail'];
    address = json['address'];
    gst = json['gst'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['patients_count'] = this.patientsCount;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['mail'] = this.mail;
    data['address'] = this.address;
    data['gst'] = this.gst;
    data['is_active'] = this.isActive;
    return data;
  }
}
