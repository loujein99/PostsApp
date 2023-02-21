import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

class PostListWidget extends StatelessWidget {
  final List<PostEntity> posts;
  const PostListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(posts[index].id.toString()),
          title: Text(
            posts[index].title.toUpperCase(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            posts[index].body,
            style: TextStyle(fontSize: 16.sp),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => PostDetailPage(post: posts[index]),
            //   ),
            // );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(thickness: 1),
    );
  }
}
