import 'package:flutter/material.dart';

class BlogActionBar extends StatelessWidget {
  const BlogActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...BlogActionType.values.sublist(0, 3).map(
              (e) => IconButton(onPressed: () {}, icon: Icon(e.icon)),
            ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: Icon(BlogActionType.save.icon)),
      ],
    );
  }
}

enum BlogActionType {
  like(Icons.favorite_border_rounded),
  comment(Icons.chat_outlined),
  share(Icons.share_outlined),
  save(Icons.bookmark_border_rounded);

  const BlogActionType(this.icon);
  final IconData icon;
}
