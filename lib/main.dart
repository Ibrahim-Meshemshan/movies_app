import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/Theme/Theme_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/initial_page/home_screen/page/bloc/home_bloc.dart';
import 'package:movies_app/features/initial_page/wishlist_screen/bloc/wishlist_bloc.dart';
import 'features/initial_page/details_screen/data/model/movie_details_response_model.dart';
import 'features/initial_page/home_page.dart';

void main() async{
 await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailsResponseModelAdapter());
  Hive.registerAdapter((MoviesDetailsAdapter()));
  await Hive.openBox<MovieDetailsResponseModel>('wishlist');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc()..add(GetTopRatedEvent())..add(GetCategoriesEvent())..add(GetMoviesEvent()),
      ),
      BlocProvider(create: (context) => WishlistBloc()..add(GetWishListEvent()),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeManager.nightTheme,
      home: HomePage(),
    );
  }
}
