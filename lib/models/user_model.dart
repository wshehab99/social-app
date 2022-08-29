class UserModel {
  String? name;
  String? email;
  String? phone;
  String? imageUrl;
  String? coverImage;
  String? userId;
  bool? isEmailVerified;
  String? userBio;
  UserModel(
      {this.name,
      this.email,
      this.imageUrl,
      this.phone,
      this.coverImage,
      this.isEmailVerified,
      this.userBio,
      this.userId});
  UserModel.fromJson({required Map<String, dynamic> json}) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    coverImage = json['coverImage'];
    userId = json['userId'];
    userBio = json['userBio'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toJson({required UserModel user}) {
    return {
      "name": user.name,
      "email": user.email,
      "phone": user.phone,
      "imageUrl": user.imageUrl ??
          "https://media.istockphoto.com/vectors/male-profile-flat-blue-simple-icon-with-long-shadow-vector-id522855255?k=20&m=522855255&s=612x612&w=0&h=fLLvwEbgOmSzk1_jQ0MgDATEVcVOh_kqEe0rqi7aM5A=",
      "coverImage":
          user.coverImage ?? "https://eataway.com/images/default-image.gif",
      "userId": user.userId,
      "userBio": user.userBio ?? "",
      "isEmailVerified": user.isEmailVerified ?? false,
    };
  }
}
