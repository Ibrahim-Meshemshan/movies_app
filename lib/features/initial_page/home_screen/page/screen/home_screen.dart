import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/initial_page/home_screen/page/widgets/categories_item.dart';
import 'package:movies_app/features/onboarding/widgets/smoot_custom.dart';

import '../../../../../core/Theme/Theme_manager.dart';
import '../../../../../core/exception/status.dart';
import '../bloc/home_bloc.dart';
import '../widgets/movie_discover.dart';
import '../widgets/top_rated_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController homeController = PageController();
  final ValueNotifier<int> selectedGenre = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: ThemeManager.nightTheme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state.topRatedStatus == Status.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                } else if (state.topRatedStatus == Status.failed) {
                  return Center(
                    child: Column(
                      children: [
                        Text('check your internet and try again',
                            style:
                                ThemeManager.nightTheme.textTheme.titleSmall),
                        ElevatedButton(
                          onPressed: () {
                            context.read<HomeBloc>().add(GetTopRatedEvent());
                          },
                          child: Text(
                            'Try Again',
                            style: ThemeManager.nightTheme.textTheme.titleSmall
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state.topRatedStatus == Status.success) {
                  return TopRatedWidget(state: state);
                }
                return Container();
              }),
              const SizedBox(height: 10),
              Center(
                  child: SmoothCustom(
                controller: homeController,
                count: 5,
                smoothColors: Colors.blue,
              )),
              const SizedBox(height: 20),
              Text('Categories',
                  style: ThemeManager.nightTheme.textTheme.titleMedium),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                if (state.categoriesStatus == Status.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  );
                } else if (state.categoriesStatus == Status.failed) {
                  return Center(
                    child: Column(
                      children: [
                        Text('check your internet and try again',
                            style:
                                ThemeManager.nightTheme.textTheme.titleSmall),
                        ElevatedButton(
                          onPressed: () {
                            context.read<HomeBloc>().add(GetCategoriesEvent());
                          },
                          child: Text(
                            'Try Again',
                            style: ThemeManager.nightTheme.textTheme.titleSmall
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state.categoriesStatus == Status.success) {
                  return CategoriesItem(
                    state: state,
                    selectedGenre: selectedGenre,
                  );
                }
                return Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 20,
                );
              }),
              const SizedBox(height: 20),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.movieStatus == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    );
                  } else if (state.movieStatus == Status.failed) {
                    return Center(
                      child: Column(
                        children: [
                          Text('check your internet and try again',
                              style:
                                  ThemeManager.nightTheme.textTheme.titleSmall),
                          ElevatedButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(GetMoviesEvent());
                            },
                            child: Text(
                              'Try Again',
                              style: ThemeManager
                                  .nightTheme.textTheme.titleSmall
                                  ?.copyWith(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state.movieStatus == Status.success) {
                    return MovieDiscover(state: state);
                  }
                  return Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: 20,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
