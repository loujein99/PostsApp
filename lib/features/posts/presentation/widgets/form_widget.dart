import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/posts/domain/entities/post_entity.dart';
import 'package:posts_app/features/posts/presentation/widgets/text_formfield.dart';

import '../bloc/add_delete_update_post/bloc/add_delete_update_bloc.dart';
import 'form_submit_btn.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final PostEntity? postEntity;
  const FormWidget({
    Key? key,
    required this.isUpdatePost,
    this.postEntity,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      titleController.text = widget.postEntity!.title;
      bodyController.text = widget.postEntity!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldWidget(
                name: "Title", multiLines: false, controller: titleController),
            TextFormFieldWidget(
                name: "Body", multiLines: true, controller: bodyController),
            FormSubmitBtn(
                isUpdatePost: widget.isUpdatePost,
                onPressed: validateFormThenUpdateOrAddPost),
          ]),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final post = PostEntity(
          id: widget.isUpdatePost ? widget.postEntity!.id : null,
          title: titleController.text,
          body: bodyController.text);

      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdateBloc>(context)
            .add(UpdatePostEvent(postEntity: post));
      } else {
        BlocProvider.of<AddDeleteUpdateBloc>(context)
            .add(AddPostEvent(postEntity: post));
      }
    }
  }
}
