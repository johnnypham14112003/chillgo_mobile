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

  final int chillCoin;

  final String? fcmToken;

  final String? googleId;

  final String? facebookId;

  final String? expertise;

  final String? language;

  final int rating;

  final String? companyName;

  final String role;

  final String status;

  //Constructor
  Account(
      {required this.id,
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
      required this.status});

  // Parse Json to Model
  // factory Account.fromJson(Map<String, dynamic> json) {
  //   return Account(
  //     id: json['id'],
  //     firebaseUid: json['firebaseUid'],
  //     email: json['email'],
  //     password: json['password'],
  //     fullName: json['fullName'],
  //     address: json['address'],
  //     phoneNumber: json['phoneNumber'],
  //     cCCD: json['cCCD'],
  //     dateOfBirth: json['dateOfBirth'] != null
  //         ? DateTime.parse(json['dateOfBirth'])
  //         : null,
  //     gender: json['gender'],
  //     joinedDate: DateTime.parse(json['joinedDate']),
  //     lastUpdated: DateTime.parse(json['lastUpdated']),
  //     chillCoin: json['chillCoin'] ?? 0,
  //     fcmToken: json['fcmToken'],
  //     googleId: json['googleId'],
  //     facebookId: json['facebookId'],
  //     expertise: json['expertise'],
  //     language: json['language'],
  //     rating: (json['rating'] != null) ? json['rating'].toDouble() : null,
  //     companyName: json['companyName'],
  //     role: json['role'],
  //     status: json['status'],
  //   );
  // }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json["id"],
      firebaseUid: json["firebase-uid"],
      email: json["email"],
      fullName: json["full-name"],
      phoneNumber: json["phone-number"],
      cCCD: json["cccd"],
      gender: json["gender"],
      role: json["role"],
      status: json["status"],
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
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'gender': gender,
        'joinedDate': joinedDate?.toIso8601String(),
        'lastUpdated': lastUpdated?.toIso8601String(),
        'chillCoin': chillCoin,
        'fcmToken': fcmToken,
        'googleId': googleId,
        'facebookId': facebookId,
        'expertise': expertise,
        'language': language,
        'rating': rating,
        'companyName': companyName,
        'role': role,
        'status': status,
      };
}
