import 'package:flutter/material.dart';

class AIMessage {
  AIMessage({
    required this.destination,
    required this.historicalSites,
    required this.recommendedActivities,
    required this.foodAndDrink,
    required this.transportation,
    required this.tips,
    required this.culturalAspects,
  });
  late final String destination;
  late final List<HistoricalSites> historicalSites;
  late final List<RecommendedActivities> recommendedActivities;
  late final List<FoodAndDrink> foodAndDrink;
  late final Transportation transportation;
  late final Tips tips;
  late final CulturalAspects culturalAspects;

  AIMessage.fromJson(Map<String, dynamic> json) {
    destination = json['destination'];
    historicalSites = List.from(json['historical_sites'] as List)
        .map((e) => HistoricalSites.fromJson(e))
        .toList();
    recommendedActivities = List.from(json['recommended_activities'])
        .map((e) => RecommendedActivities.fromJson(e))
        .toList();
    foodAndDrink = List.from(json['food_and_drink'])
        .map((e) => FoodAndDrink.fromJson(e))
        .toList();
    transportation = Transportation.fromJson(json['transportation']);
    tips = Tips.fromJson(json['tips']);
    culturalAspects = CulturalAspects.fromJson(json['cultural_aspects']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['destination'] = destination;
    data['historical_sites'] = historicalSites.map((e) => e.toJson()).toList();
    data['recommended_activities'] =
        recommendedActivities.map((e) => e.toJson()).toList();
    data['food_and_drink'] = foodAndDrink.map((e) => e.toJson()).toList();
    data['transportation'] = transportation.toJson();
    data['tips'] = tips.toJson();
    data['cultural_aspects'] = culturalAspects.toJson();
    return data;
  }
}

class HistoricalSites {
  HistoricalSites({
    required this.name,
    required this.description,
    required this.history,
    required this.significance,
    required this.visitingTime,
    required this.facilities,
  });
  late final String name;
  late final String description;
  late final String history;
  late final String significance;
  late final String visitingTime;
  late final String facilities;

  HistoricalSites.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    history = json['history'];
    significance = json['significance'];
    visitingTime = json['visiting_time'];
    facilities = json['Facilities'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['history'] = history;
    data['significance'] = significance;
    data['visiting_time'] = visitingTime;
    data['Facilities'] = facilities;
    return data;
  }
}

class RecommendedActivities {
  RecommendedActivities({
    required this.activity,
    required this.description,
    required this.location,
    required this.timeRequired,
    required this.cost,
  });
  late final String activity;
  late final String description;
  late final String location;
  late final String timeRequired;
  late final String cost;

  RecommendedActivities.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    description = json['description'];
    location = json['location'];
    timeRequired = json['time_required'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['activity'] = activity;
    data['description'] = description;
    data['location'] = location;
    data['time_required'] = timeRequired;
    data['cost'] = cost;
    return data;
  }
}

class FoodAndDrink {
  FoodAndDrink({
    required this.name,
    required this.description,
    required this.location,
    required this.price,
  });
  late final String name;
  late final String description;
  late final String location;
  late final String price;

  FoodAndDrink.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    location = json['location'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['location'] = location;
    data['price'] = price;
    return data;
  }
}

class Transportation {
  Transportation({
    required this.gettingThere,
    required this.gettingAround,
    // required this.distanceToKeySites,
  });
  late final String gettingThere;
  late final String gettingAround;
  // late final DistanceToKeySites distanceToKeySites;

  Transportation.fromJson(Map<String, dynamic> json) {
    gettingThere = json['getting_there'];
    gettingAround = json['getting_around'];
    // distanceToKeySites = DistanceToKeySites.fromJson(json['distance_to_key_sites']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['getting_there'] = gettingThere;
    data['getting_around'] = gettingAround;
    // _data['distance_to_key_sites'] = distanceToKeySites.toJson();
    return data;
  }
}

// class DistanceToKeySites {
//   DistanceToKeySites({
//     required this.lăngChủ_tịch,
//     required this.phố_cổ,
//     required this.vănMiếuQuốcTử_giám,
//   });
//   late final String lăngChủ_tịch;
//   late final String phố_cổ;
//   late final String vănMiếuQuốcTử_giám;

//   DistanceToKeySites.fromJson(Map<String, dynamic> json){
//     lăngChủ_tịch = json['lăng_chủ_tịch'];
//     phố_cổ = json['phố_cổ'];
//     vănMiếuQuốcTử_giám = json['văn_miếu_quốc_tử_giám'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['lăng_chủ_tịch'] = lăngChủ_tịch;
//     _data['phố_cổ'] = phố_cổ;
//     _data['văn_miếu_quốc_tử_giám'] = vănMiếuQuốcTử_giám;
//     return _data;
//   }
// }

class Tips {
  Tips({
    required this.bestTimeToVisit,
    required this.whatToPack,
    required this.localCustoms,
  });
  late final String bestTimeToVisit;
  late final String whatToPack;
  late final String localCustoms;

  Tips.fromJson(Map<String, dynamic> json) {
    bestTimeToVisit = json['best_time_to_visit'];
    whatToPack = json['what_to_pack'];
    localCustoms = json['local_customs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['best_time_to_visit'] = bestTimeToVisit;
    data['what_to_pack'] = whatToPack;
    data['local_customs'] = localCustoms;
    return data;
  }
}

class CulturalAspects {
  CulturalAspects({
    required this.language,
    required this.traditions,
    required this.arts,
  });
  late final String language;
  late final String traditions;
  late final String arts;

  CulturalAspects.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    traditions = json['traditions'];
    arts = json['arts'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['language'] = language;
    data['traditions'] = traditions;
    data['arts'] = arts;
    return data;
  }
}

final messageExample = {
  "destination": "Hà Nội",
  "historical_sites": [
    {
      "name": "Lăng Chủ tịch Hồ Chí Minh",
      "description":
          "Nơi an nghỉ của Chủ tịch Hồ Chí Minh, vị lãnh tụ kính yêu của dân tộc Việt Nam.",
      "history":
          "Được xây dựng vào năm 1973, Lăng Hồ Chí Minh là biểu tượng của sự kính trọng đối với Chủ tịch Hồ Chí Minh.",
      "significance":
          "Là địa điểm linh thiêng, nơi lưu giữ hồn cốt của dân tộc Việt Nam, thu hút đông đảo du khách trong và ngoài nước.",
      "visiting_time":
          "Mở cửa từ 7:30 đến 10:30 vào các ngày trong tuần, trừ thứ Hai và thứ Sáu.",
      "Facilities":
          "Có khu vực gửi đồ, tạo điều kiện cho du khách tham quan thoải mái."
    },
    {
      "name": "Old Quarter (Phố Cổ Hà Nội)",
      "description":
          "Khu phố với kiến trúc cổ kính, nơi lưu giữ nét đẹp văn hóa truyền thống của Hà Nội.",
      "history":
          "Được hình thành từ thế kỷ 13, khu phố này là nơi sinh sống của các nghề thủ công truyền thống.",
      "significance":
          "Là trái tim văn hóa của Hà Nội, nơi du khách có thể cảm nhận được nhịp sống của người dân địa phương.",
      "visiting_time":
          "Thích hợp tham quan vào cả ngày, đặc biệt là buổi tối khi phố trở nên sôi động.",
      "Facilities":
          "Có nhiều quán cà phê và nhà hàng phục vụ du khách ngay trong khu vực."
    },
    {
      "name": "Văn Miếu - Quốc Tử Giám",
      "description":
          "Quần thể di tích quốc gia đặc biệt, được xem là trường đại học đầu tiên của Việt Nam.",
      "history":
          "Được xây dựng vào năm 1070 thời Nhà Lý, là nơi đào tạo nhân tài cho đất nước.",
      "significance":
          "Là biểu tượng của tri thức Việt Nam, nơi lưu giữ những giá trị văn hóa và giáo dục của dân tộc.",
      "visiting_time": "Mở cửa từ 8:00 đến 17:00 hàng ngày.",
      "Facilities":
          "Có dịch vụ hướng dẫn viên, khu vực nghỉ ngơi và cửa hàng lưu niệm."
    }
  ],
  "recommended_activities": [
    {
      "activity": "Tham quan Lăng Chủ tịch Hồ Chí Minh",
      "description":
          "Chiêm ngưỡng kiến trúc hoành tráng của Lăng Chủ tịch và tham quan Nhà số 67 nơi Bác đã sống và làm việc.",
      "location": "Lăng Chủ tịch Hồ Chí Minh, Ba Đình, Hà Nội.",
      "time_required": "Khoảng 1-2 giờ.",
      "cost": "Miễn phí."
    },
    {
      "activity": "Khám phá Phố Cổ Hà Nội",
      "description":
          "Đi dạo qua các phố cổ với kiến trúc truyền thống, thưởng thức ẩm thực địa phương và mua sắm quà lưu niệm.",
      "location": "Phố Cổ, quận Hoàn Kiếm.",
      "time_required": "Cả ngày.",
      "cost":
          "Miễn phí để tham quan, chi phí cho ăn uống và quà lưu niệm tùy theo ngân sách."
    },
    {
      "activity": "Thư giãn tại Hồ Gươm",
      "description":
          "Ngắm cảnh thơ mộng, đi bộ quanh hồ và khám phá đền Ngọc Sơn trên đảo nhỏ giữa hồ.",
      "location": "Hồ Gươm, trung tâm Hoàn Kiếm.",
      "time_required": "Khoảng 1 giờ.",
      "cost": "Miễn phí, vé vào đền Ngọc Sơn khoảng 20,000 VND."
    }
  ],
  "food_and_drink": [
    {
      "name": "Phở Bò",
      "description":
          "Món ăn nổi tiếng với sợi phở mịn màng, nước dùng thanh trong và thịt bò tender.",
      "location": "Có thể tìm thấy tại Phở Bát Đàn, Hoàn Kiếm.",
      "price": "Khoảng 40,000 - 60,000 VND một suất."
    },
    {
      "name": "Bánh Tôm Hồ Tây",
      "description":
          "Món bánh giòn tan với nhân tôm tươi, thưởng thức cùng rau sống và nước chấm ngon miệng.",
      "location": "Nhà hàng Bánh Tôm Hồ Tây gần Hồ Tây.",
      "price": "Khoảng 100,000 VND cho một phần ăn."
    },
    {
      "name": "Cà Phê Trứng",
      "description":
          "Thức uống đặc biệt với vị béo ngậy của lòng đỏ trứng gà, thơm ngon và độc đáo.",
      "location": "Cà phê Giảng trên phố Giảng Võ.",
      "price": "Khoảng 25,000 VND một ly."
    }
  ],
  "transportation": {
    "getting_there":
        "Bạn có thể đến Hà Nội bằng máy bay, tàu hỏa hoặc xe khách. Sân bay Quốc tế Nội Bài cách trung tâm thành phố khoảng 30 phút đi xe.",
    "getting_around":
        "Thành phố có taxi, xe buýt và dịch vụ cho thuê xe đạp, giúp dễ dàng di chuyển.",
    "distance_to_key_sites": {
      "lăng_chủ_tịch":
          "Lăng Chủ tịch Hồ Chí Minh nằm trong trung tâm thành phố, dễ dàng tiếp cận từ mọi hướng.",
      "phố_cổ": "Phố Cổ cách Lăng Chủ tịch khoảng 10 phút đi taxi.",
      "văn_miếu_quốc_tử_giám": "Văn Miếu cách phố cổ khoảng 15 phút đi taxi."
    }
  },
  "tips": {
    "best_time_to_visit":
        "Thời gian lý tưởng để du lịch Hà Nội là từ tháng 9 đến tháng 11 và từ tháng 3 đến tháng 5 khi thời tiết mát mẻ, dễ chịu.",
    "what_to_pack":
        "Nên mang theo áo khoác nhẹ vì Hà Nội thường có gió lạnh vào mùa đông. Đừng quên mang giày thoải mái để dễ dàng walking around.",
    "local_customs":
        "Người Hà Nội thường rất lịch sự và thân thiện. Khi giao tiếp, nên giữ khoảng cách và thể hiện sự tôn trọng."
  },
  "cultural_aspects": {
    "language":
        "Người Hà Nội nói tiếng Việt, nhiều người có thể giao tiếp cơ bản bằng tiếng Anh.",
    "traditions":
        "Hà Nội có nhiều lễ hội truyền thống như lễ hội đền Hùng, lễ hội Hoàng Thành Thăng Long.",
    "arts":
        "Thành phố có nhiều hoạt động nghệ thuật như ca trù, chèo và các buổi hòa nhạc cổ điển tại Nhà hát Lớn Hà Nội."
  }
};

enum PlanTravelEnum {
  transportation(
      title: 'Phương tiện di chuyển', icon: Icons.local_taxi_rounded),
  destination(title: 'Điểm tham quan', icon: Icons.map),
  food(title: 'Ẩm thực', icon: Icons.food_bank_outlined),
  tips(title: 'Thời gian lý tưởng', icon: Icons.access_time_outlined),
  culturalAspects(
      title: 'Đối tượng thích hợp', icon: Icons.people_alt_outlined),
  preferential(title: 'Ưu đãi', icon: Icons.local_activity_rounded);

  const PlanTravelEnum({required this.title, required this.icon});

  final String title;
  final IconData icon;
}
