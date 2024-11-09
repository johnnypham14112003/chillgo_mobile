import 'package:chillgo_mobile/src/models/blog.dart';
import 'package:flutter/material.dart';

class BlogProvider extends ChangeNotifier {
  Blog? get firstBlog => _firstBlog;
  Blog? _firstBlog;

  List<Blog> get otherBlogs => _otherBlogs;
  List<Blog> _otherBlogs = [];

  Blog? get blogDetail => _blogDetail;
  Blog? _blogDetail;

  BlogProvider() {
    init();
  }
  init() async {
    //tạm, sẽ thay khi có api
    final blogs = blogsExmple.map((blog) => Blog.fromMap(blog)).toList();
    _firstBlog = blogs.first;
    _otherBlogs = blogs.sublist(1, blogs.length);
    notifyListeners();
  }

  void getBlogById(String id) {
    //tạm, sẽ thay khi có api
    _blogDetail = _otherBlogs.firstWhere((blog) => blog.title == id);
    notifyListeners();
  }
}
