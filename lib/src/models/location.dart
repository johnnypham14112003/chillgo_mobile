class Location {
  Location({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.coordinates,
    required this.ticketPrice,
    required this.totalRating,
    required this.isMarketingPaid,
    required this.partnerId,
    required this.lastUpdated,
    required this.status,
    required this.bookingDetails,
    required this.comments,
    required this.images,
    required this.partner,
    required this.schedules,
    required this.accounts,
  });

  final String id;
  final String name;
  final String description;
  final String? address;
  final String coordinates;
  final double? ticketPrice;
  final double? totalRating;
  final bool? isMarketingPaid;
  final dynamic partnerId;
  final DateTime? lastUpdated;
  final String? status;
  final List<dynamic> bookingDetails;
  final List<dynamic> comments;
  List<String> images;
  final dynamic partner;
  final List<dynamic> schedules;
  final List<dynamic> accounts;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      address: json["address"],
      coordinates: json["coordinates"],
      ticketPrice: json["ticket-price"],
      totalRating: json["total-rating"],
      isMarketingPaid: json["is-marketing-paid"],
      partnerId: json["partner-id"],
      lastUpdated: DateTime.tryParse(json["last-updated"] ?? ""),
      status: json["status"],
      bookingDetails: json["booking-details"] == null
          ? []
          : List<dynamic>.from(json["booking-details"]!.map((x) => x)),
      comments: json["comments"] == null
          ? []
          : List<String>.from(json["comments"]!.map((x) => x)),
      images: json["images"] == null || json["images"]!.isEmpty
          ? ['']
          : List<String>.from(json["images"]!.map((x) => x)),
      partner: json["partner"],
      schedules: json["schedules"] == null
          ? []
          : List<dynamic>.from(json["schedules"]!.map((x) => x)),
      accounts: json["accounts"] == null
          ? []
          : List<dynamic>.from(json["accounts"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "coordinates": coordinates,
        "ticket-price": ticketPrice,
        "total-rating": totalRating,
        "is-marketing-paid": isMarketingPaid,
        "partner-id": partnerId,
        "last-updated": lastUpdated?.toIso8601String(),
        "status": status,
        "booking-details": bookingDetails.map((x) => x).toList(),
        "comments": comments.map((x) => x).toList(),
        "images": images.map((x) => x).toList(),
        "partner": partner,
        "schedules": schedules.map((x) => x).toList(),
        "accounts": accounts.map((x) => x).toList(),
      };
}
