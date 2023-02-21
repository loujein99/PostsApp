import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';

import '../widgets/post_details_widget.dart';

class PostDetailPage extends StatelessWidget {
  final PostEntity postEntity;
  const PostDetailPage({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text("Post Details"));

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PostDetailWidget(post: postEntity),
      ),
    );
  }
}
