class Blog {
  String title;
  String content;
  List<String> images;
  Author author;
  String tag;
  Blog({
    required this.title,
    required this.content,
    required this.images,
    required this.author,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'url': images,
      'author': author.toMap(),
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      title: map['title'] as String,
      content: map['content'] as String,
      images: List<String>.from(map['images'] as List),
      author: Author.fromMap(map['author'] as Map<String, dynamic>),
      tag: map['tag'] as String,
    );
  }
}

class Author {
  String name;
  String bio;
  String url;
  Author({
    required this.name,
    required this.bio,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'bio': bio,
      'url': url,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      name: map['name'] as String,
      bio: map['bio'] as String,
      url: map['url'] as String,
    );
  }
}

final blogsExmple = [
  {
    'title': '10 điểm đến thú vị không thể bỏ qua khi du lịch Côn Đảo',
    'content':
        'Là một trong những hòn đảo bí mật và lãng mạn nhất thế giới, Côn Đảo là điểm đến hấp dẫn dành cho du khách. ',
    'images': [
      'https://vpdt.vietrantour.com.vn/data/upload/2022/0528/589-con-dao-tu-dia-nguc-tran-gian-den-thien-duong-du-l.jpg',
      'https://media.vneconomy.vn/images/upload/2024/07/04/con-dao.jpg',
      'https://www.vietnam.travel/sites/default/files/inline-images/shutterstock_1944454519.jpg',
    ],
    'author': {
      'name': 'Hà Đức Lương',
      'bio': 'Blogger',
      'url': 'https://picsum.photos/id/240/200/300',
    },
    'tag': 'CônĐảo',
  },
  {
    'title':
        '9 di tích lịch sử ở Thành phố Hồ Chí Minh sống mãi cùng thời gian',
    'content':
        'Danh sách 9 di tích lịch sử ở Thành phố Hồ Chí Minh là những điểm tham quan...',
    'images': [
      'https://ik.imagekit.io/tvlk/blog/2023/01/ben-nha-rong-9.jpg?tr=dpr-2,w-675',
    ],
    'author': {
      'name': 'Hà Đức Lương',
      'bio': 'Blogger',
      'url': 'https://picsum.photos/id/240/200/300',
    },
    'tag': 'TPHCM',
  },
  {
    'title': 'Nơi vùng đất cách mạng Tây Bắc…',
    'content':
        'Tây Bắc là vùng đất kỳ lạ và hấp dẫn, bởi không chỉ có cảnh quan thiên nhiên hùng vĩ, ',
    'images': [
      'https://minhantransport.com/wp-content/uploads/2022/06/du-lich-tay-bac5-1.jpg',
    ],
    'author': {
      'name': 'Hà Đức Lương',
      'bio': 'Blogger',
      'url': 'https://picsum.photos/id/240/200/300',
    },
    'tag': 'TâyBăc',
  },
  {
    'title': 'Di tích Nhà tù Hỏa Lò',
    'content':
        'Mình cũng bon chon xã hội bon chen giữa dòng người tấp nập để ghé thăm Nhà tù Hỏa Lò',
    'images': [
      'https://kenh14cdn.com/203336854389633024/2022/5/27/5-16536339254391986075323.jpg',
    ],
    'author': {
      'name': 'Hà Đức Lương',
      'bio': 'Blogger',
      'url': 'https://picsum.photos/id/240/200/300',
    },
    'tag': 'HàNội',
  },
  {
    'title': 'Tour đi tìm dấu ấn Trường Sơn huyền thoại',
    'content':
        'Để giữ cho "mạch máu" không tắt, đã có hàng vạn bộ đội thanh niên xung phong',
    'images': [
      'https://media-cdn-v2.laodong.vn/storage/newsportal/2024/2/1/1299967/Cau-Tra-Ang.jpg',
    ],
    'author': {
      'name': 'Hà Đức Lương',
      'bio': 'Blogger',
      'url': 'https://picsum.photos/id/240/200/300',
    },
    'tag': 'HàNội',
  },
];
