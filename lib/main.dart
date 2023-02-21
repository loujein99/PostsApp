import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts_app/features/posts/presentation/bloc/add_delete_update_post/bloc/add_delete_update_bloc.dart';
import 'package:posts_app/features/posts/presentation/bloc/posts_bloc/posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;
import 'package:posts_app/core/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_)=> di.sl<AddDeleteUpdateBloc>())
          // BlocProvider(
          //     create: (_) => PostsBloc(
          //         getAllPosts: GetAllPostsUsecase(PostsRepositoryImpl(
          //             localDataSource: PostLocalDataSourceImpl(
          //                 sharedPreferences: sharedPreferences),
          //             remoteDataSource:
          //                 PostRemoteDataSourceImpl(client: Client()),
          //             networkInfo:
          //                 NetworkInfoImpl(InternetConnectionChecker())))))
        ],
        child: ScreenUtilInit(
          designSize: const Size(390, 842),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: appTheme,
                home: PostsPage());
          },
        ));
  }
}
