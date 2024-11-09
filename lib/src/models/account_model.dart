import 'package:chillgo_mobile/src/models/chat_ai_package.dart';

class Account {
  final String id;
  final String firebaseUid;
  final String email;
  final String fullName;
  final String? address;
  final String? phoneNumber;
  final String? cCCD;
  final DateTime? dateOfBirth;
  final String? gender;
  final DateTime? joinedDate;
  final DateTime? lastUpdated;
  final int? chillCoin;
  final String? fcmToken;
  final String? googleId;
  final String? facebookId;
  final String? expertise;
  final String? language;
  final int? rating;
  final String? companyName;
  final String? role;
  final String? status;
  String? avatarUrl;
  ChatAiPackage? package;

  //Constructor
  Account({
    required this.id,
    required this.firebaseUid,
    required this.email,
    required this.fullName,
    this.address,
    this.phoneNumber,
    this.cCCD,
    this.dateOfBirth,
    this.gender,
    this.joinedDate,
    this.lastUpdated,
    this.chillCoin = 0,
    this.fcmToken,
    this.googleId,
    this.facebookId,
    this.expertise,
    this.language,
    this.rating = 0,
    this.companyName,
    required this.role,
    required this.status,
    this.avatarUrl,
    this.package,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      firebaseUid: json['firebase-uid'],
      email: json['email'],
      fullName: json['full-name'],
      address: json['address'],
      phoneNumber: json['phone-number'],
      cCCD: json['cccd'],
      dateOfBirth: json['date-of-birth'] != null
          ? DateTime.tryParse(json['date-of-birth'])
          : null,
      gender: json['gender'],
      // joinedDate: json['joined-date'] != null
      //     ? DateTime.tryParse(json['joined-date'])
      //     : null,
      // lastUpdated: json['last-updated'] != null
      //     ? DateTime.tryParse(json['last-updated'])
      //     : null,
      chillCoin: json['chill-coin'],
      fcmToken: json['fcm-token'],
      googleId: json['google-id'],
      facebookId: json['facebook-id'],
      expertise: json['expertise'],
      language: json['language'],
      rating: json['rating'],
      companyName: json['company-name'],
      role: json['role'],
      status: json['status'],
      avatarUrl: json["avatar-url"],
    );
  }

  // Parse Model to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'firebase-uid': firebaseUid,
        'email': email,
        'full-name': fullName,
        'address': address,
        'phone-number': phoneNumber,
        'cccd': cCCD,
        'date-of-birth': dateOfBirth.toString(),
        'gender': gender,
        // 'joined-date': joinedDate,
        // 'last-updated': lastUpdated,
        'chill-coin': chillCoin,
        'fcm-token': fcmToken,
        'google-id': googleId,
        'facebook-id': facebookId,
        'expertise': expertise,
        'language': language,
        'rating': rating,
        'company-name': companyName,
        'role': role,
        'status': status,
        'avatar-url': avatarUrl
      };

  Map<String, dynamic> toJsonForUpdate() => {
        "id": id,
        "full-name": fullName,
        "address": address,
        "phone-number": phoneNumber,
        "cccd": cCCD,
        "date-of-birth": dateOfBirth.toString(),
        "gender": gender,
        "expertise": expertise,
        "language": language,
        "company-name": companyName,
      };
}
