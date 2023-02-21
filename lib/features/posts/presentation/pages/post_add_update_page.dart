import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/core/utils/snackbar_message.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_delete_update_post/bloc/add_delete_update_bloc.dart';
import 'package:posts_app/features/posts/presentation/pages/posts_page.dart';
import 'package:posts_app/features/posts/presentation/widgets/loading_widget.dart';

import '../widgets/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  final PostEntity? postEntity;
  final bool isUpdatePost;
  const PostAddUpdatePage(
      {super.key, this.postEntity, required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() =>
      AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post"));
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocConsumer<AddDeleteUpdateBloc, AddDeleteUpdateState>(
              builder: ((context, state) {
            if (state is LoadingAddDeleteUpdateState) {
              return const LoadingWidget();
            } else {
                return FormWidget(
                    isUpdatePost: isUpdatePost,
                    postEntity: isUpdatePost ? postEntity : null);
              
              
            }
          }), listener: ((context, state) {
            if (state is MessageAddDeleteUpdateState) {
              SnackBarMessage().showSuccessSnackBar(message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PostsPage()),
                  (route) => false);
            } else if (state is ErrorAddDeleteUpdateState) {
               SnackBarMessage().showErrorSnackBar(message: state.message, context: context);
            }
          }))),
    );
  }
}
