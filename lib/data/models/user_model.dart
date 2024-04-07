class UserModel {
  final String? uuId;
  final String activity;
  final String activityAddress;
  final int age;
  final String birthday;
  final String dream;
  final String favourite;
  final double ieltsLevel;
  final String lastName;
  final String middleName;
  final String name;
  final String imageUrl;

  UserModel({
    required this.imageUrl,
    required this.lastName,
    required this.activityAddress,
    required this.name,
    this.uuId,
    required this.activity,
    required this.age,
    required this.birthday,
    required this.dream,
    required this.favourite,
    required this.ieltsLevel,
    required this.middleName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      imageUrl: json["profile_image"] as String? ?? "",
      lastName: json["last_name"] as String? ?? "",
      activityAddress: json["activity_address"] as String? ?? "",
      name: json["name"] as String? ?? "",
      uuId: json["_uuid"] as String? ?? "",
      activity: json["activity"] as String? ?? "",
      age: json["age"] as int? ?? 0,
      birthday: json["birthday"] as String? ?? "",
      dream: json["dream"] as String? ?? "",
      favourite: json["favourite"] as String? ?? "",
      ieltsLevel: (json["ielts_level"] as num? ?? 0).toDouble(),
      middleName: json["middle_name"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "profile_image": imageUrl,
      "name": name,
      "last_name": lastName,
      "middle_name": middleName,
      "ielts_level": ieltsLevel,
      "favourite": favourite,
      "dream": dream,
      "birthday": birthday,
      "age": age,
      "activity": activity,
      "activity_address": activityAddress
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "_uuid": uuId,
      "profile_image": imageUrl,
      "name": name,
      "last_name": lastName,
      "middle_name": middleName,
      "ielts_level": ieltsLevel,
      "favourite": favourite,
      "dream": dream,
      "birthday": birthday,
      "age": age,
      "activity": activity,
      "activity_address": activityAddress
    };
  }

  static UserModel initialValue = UserModel(
      imageUrl: "",
      lastName: "",
      activityAddress: "",
      name: "",
      activity: "",
      age: 0,
      birthday: "",
      dream: "",
      favourite: "",
      ieltsLevel: 0,
      middleName: "");

  UserModel copyWith({
    String? activity,
    String? activityAddress,
    int? age,
    String? birthday,
    String? dream,
    String? favourite,
    double? ieltsLevel,
    String? lastName,
    String? middleName,
    String? name,
    String? imageUrl,
    String? uuid,
  }) {
    return UserModel(
      imageUrl: imageUrl ?? this.imageUrl,
      activityAddress: activityAddress ?? this.activityAddress,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      activity: activity ?? this.activity,
      age: age ?? this.age,
      dream: dream ?? this.dream,
      birthday: birthday ?? this.birthday,
      favourite: favourite ?? this.favourite,
      ieltsLevel: ieltsLevel ?? this.ieltsLevel,
      middleName: middleName ?? this.middleName,
      uuId: uuid ?? uuId,
    );
  }
}
