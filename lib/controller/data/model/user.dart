class User {
  int? id;
  String? name;
  String? email;
  String? profileImage;
  int? phoneNumber;
  int? idNumber;
  String? dateOfBirth;
  String? gender;
  String? lang;
  String? verifiedAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  User(
      {this.id,
        this.name,
        this.email,
        this.profileImage,
        this.phoneNumber,
        this.idNumber,
        this.dateOfBirth,
        this.gender,
        this.lang,
        this.verifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profile_image'];
    phoneNumber = json['phone_number'];
    idNumber = json['id_number'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    lang = json['lang'];
    verifiedAt = json['verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    data['phone_number'] = this.phoneNumber;
    data['id_number'] = this.idNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['lang'] = this.lang;
    data['verified_at'] = this.verifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
  Map<String, dynamic> toJsonRegister() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber.toString();
    data['id_number'] = this.idNumber.toString();
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['lang'] = this.lang;
    return data;
  }
}
