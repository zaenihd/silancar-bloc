import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final int code;
  final bool success;
  final String message;
  final DataProfile data;

  ProfileModel({
    required this.code,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        code: json["code"] ?? 0,
        success: json["success"] ?? false,
        message: json["message"] ?? '',
        data: DataProfile.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

// ==========================================================

class DataProfile {
  final int id;
  final String name;
  final String email;
  final DateTime emailVerifiedAt;
  final String role;
  final String status;
  final String otp;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Client> client;
  final List<CardAk1> cardAk1;

  DataProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.status,
    required this.otp,
    required this.createdAt,
    required this.updatedAt,
    required this.client,
    required this.cardAk1,
  });

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        emailVerifiedAt:
            DateTime.tryParse(json["email_verified_at"] ?? '') ??
                DateTime.fromMillisecondsSinceEpoch(0),
        role: json["role"] ?? '',
        status: json["status"] ?? '',
        otp: json["otp"] ?? '',
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        client: (json["client"] as List<dynamic>? ?? [])
            .map((e) => Client.fromJson(e))
            .toList(),
        cardAk1: (json["card_ak1"] as List<dynamic>? ?? [])
            .map((e) => CardAk1.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "role": role,
        "status": status,
        "otp": otp,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "client": client.map((e) => e.toJson()).toList(),
        "card_ak1": cardAk1.map((e) => e.toJson()).toList(),
      };
}

// ==========================================================

class CardAk1 {
  final int id;
  final String userId;
  final String fullName;
  final String placeOfBirth;
  final DateTime dateOfBirth;
  final String gender;
  final String religion;
  final String nik;
  final String status;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;

  CardAk1({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.gender,
    required this.religion,
    required this.nik,
    required this.status,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CardAk1.fromJson(Map<String, dynamic> json) => CardAk1(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? '',
        fullName: json["full_name"] ?? '',
        placeOfBirth: json["place_of_birth"] ?? '',
        dateOfBirth: DateTime.tryParse(json["date_of_birth"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        gender: json["gender"] ?? '',
        religion: json["religion"] ?? '',
        nik: json["nik"] ?? '',
        status: json["status"] ?? '',
        address: json["address"] ?? '',
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "full_name": fullName,
        "place_of_birth": placeOfBirth,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "gender": gender,
        "religion": religion,
        "nik": nik,
        "status": status,
        "address": address,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

// ==========================================================

class Client {
  final int id;
  final String userId;
  final String userName;
  final String gender;
  final DateTime birthDate;
  final String status;
  final String phone;
  final String province;
  final String subdistrict;
  final String address;
  final String image;
  final String age;
  final String high;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic description;
  final String noAk1;
  final List<Education> education;
  final List<Experience> experience;
  final List<Education> lastEducation;

  Client({
    required this.id,
    required this.userId,
    required this.userName,
    required this.gender,
    required this.birthDate,
    required this.status,
    required this.phone,
    required this.province,
    required this.subdistrict,
    required this.address,
    required this.image,
    required this.age,
    required this.high,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.noAk1,
    required this.education,
    required this.experience,
    required this.lastEducation,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? '',
        userName: json["user_name"] ?? '',
        gender: json["gender"] ?? '',
        birthDate: DateTime.tryParse(json["birth_date"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        status: json["status"] ?? '',
        phone: json["phone"] ?? '',
        province: json["province"] ?? '',
        subdistrict: json["subdistrict"] ?? '',
        address: json["address"] ?? '',
        image: json["image"] ?? '',
        age: json["age"] ?? '',
        high: json["high"] ?? '',
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        description: json["description"],
        noAk1: json["noAk1"] ?? '',
        education: (json["education"] as List<dynamic>? ?? [])
            .map((e) => Education.fromJson(e))
            .toList(),
        experience: (json["experience"] as List<dynamic>? ?? [])
            .map((e) => Experience.fromJson(e))
            .toList(),
        lastEducation: (json["last_education"] as List<dynamic>? ?? [])
            .map((e) => Education.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "gender": gender,
        "birth_date": birthDate.toIso8601String(),
        "status": status,
        "phone": phone,
        "province": province,
        "subdistrict": subdistrict,
        "address": address,
        "image": image,
        "age": age,
        "high": high,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "description": description,
        "noAk1": noAk1,
        "education": education.map((e) => e.toJson()).toList(),
        "experience": experience.map((e) => e.toJson()).toList(),
        "last_education": lastEducation.map((e) => e.toJson()).toList(),
      };
}

// ==========================================================

class Education {
  final int id;
  final String clientId;
  final String grade;
  final String university;
  final String major;
  final String graduationYear;
  final String duration;
  final dynamic ipk;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic isHere;

  Education({
    required this.id,
    required this.clientId,
    required this.grade,
    required this.university,
    required this.major,
    required this.graduationYear,
    required this.duration,
    required this.ipk,
    required this.createdAt,
    required this.updatedAt,
    required this.isHere,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"] ?? 0,
        clientId: json["client_id"] ?? '',
        grade: json["grade"] ?? '',
        university: json["university"] ?? '',
        major: json["major"] ?? '',
        graduationYear: json["graduation_year"] ?? '',
        duration: json["duration"] ?? '',
        ipk: json["ipk"],
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        isHere: json["is_here"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_id": clientId,
        "grade": grade,
        "university": university,
        "major": major,
        "graduation_year": graduationYear,
        "duration": duration,
        "ipk": ipk,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_here": isHere,
      };
}

// ==========================================================

class Experience {
  final int id;
  final String clientId;
  final String company;
  final String position;
  final String duration;
  final String salary;
  final dynamic isHere;
  final dynamic description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Experience({
    required this.id,
    required this.clientId,
    required this.company,
    required this.position,
    required this.duration,
    required this.salary,
    required this.isHere,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"] ?? 0,
        clientId: json["client_id"] ?? '',
        company: json["company"] ?? '',
        position: json["position"] ?? '',
        duration: json["duration"] ?? '',
        salary: json["salary"] ?? '',
        isHere: json["is_here"],
        description: json["description"],
        createdAt: DateTime.tryParse(json["created_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        updatedAt: DateTime.tryParse(json["updated_at"] ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "client_id": clientId,
        "company": company,
        "position": position,
        "duration": duration,
        "salary": salary,
        "is_here": isHere,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
