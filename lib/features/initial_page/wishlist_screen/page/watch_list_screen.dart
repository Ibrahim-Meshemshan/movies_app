import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Theme/Theme_manager.dart';
import '../../home_screen/page/bloc/home_bloc.dart';
import '../../search_screen/page/widgets/details_search.dart';
import '../bloc/wishlist_bloc.dart';


class WatchListScreen extends StatelessWidget {
  WatchListScreen({super.key});

  final HomeState detailsState = const HomeState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return Scaffold(
          body: state.wishlistMovies.isEmpty
              ? Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/magic-box 1.png'),
                        const Text(
                          'There is no movies yet',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          textAlign: TextAlign.center,
                          'Find your movie by Type title,categories, years,etc',
                          style: TextStyle(
                              color: ThemeManager.greyColor, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    itemCount: state.wishlistMovies.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onLongPress: () {
                          context.read<WishlistBloc>().add(RemoveWishListEvent(
                              id: state.wishlistMovies[index].id!));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${state.wishlistMovies[index].posterPath}'),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.wishlistMovies[index].title!,
                                    style: const TextStyle(
                                        color: ThemeManager.whiteColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  DetailsSearch(
                                      icon: Icons.star,
                                      text: state
                                          .wishlistMovies[index].voteAverage!
                                          .toString(),
                                      color: ThemeManager.orangeColor),
                                  const SizedBox(height: 5),
                                  DetailsSearch(
                                      icon: Icons.list,
                                      text: state
                                          .wishlistMovies[index].voteCount
                                          .toString(),
                                      color: ThemeManager.whiteColor),
                                  const SizedBox(height: 5),
                                  DetailsSearch(
                                      icon: Icons.calendar_today,
                                      text: state
                                          .wishlistMovies[index].releaseDate!
                                          .toString(),
                                      color: ThemeManager.whiteColor),
                                  const SizedBox(height: 5),
                                  DetailsSearch(
                                      icon: Icons.access_time_outlined,
                                      text: state.wishlistMovies[index].runtime!
                                          .toString(),
                                      color: ThemeManager.whiteColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
