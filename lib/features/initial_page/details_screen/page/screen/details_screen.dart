import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/exception/status.dart';
import 'package:movies_app/features/initial_page/home_screen/page/bloc/home_bloc.dart';

import '../../../../../core/Theme/Theme_manager.dart';
import '../../../wishlist_screen/bloc/wishlist_bloc.dart';
import '../widgets/cast_widget.dart';
import '../widgets/review_widget.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = 'movies_details';

  const DetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetDetailsEvent(movieId: widget.id));
    context.read<HomeBloc>().add(GetReviewEvent(movieId: widget.id));
    context.read<HomeBloc>().add(GetCreditsEvent(movieId: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('Current movieDetailsStatus: ${state.detailsStatus}');
        return DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                leading: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    )),
                title: const Text(
                  'Details',
                  style: TextStyle(color: ThemeManager.whiteColor),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      if (state.moviesDetails != null) {
                        context.read<WishlistBloc>().add(AddWishListEvent(
                            movieDetailsResponseModel: state.moviesDetails!));
                      }
                    },
                    icon: const Icon(
                      Icons.bookmark,
                      size: 30,
                    ),
                    color: Colors.white,
                  )
                ],
                backgroundColor: ThemeManager.primaryColor,
              ),
              body: switch (state.detailsStatus) {
                Status.success => Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.4,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                    child: Image.network(
                                      // 'https://image.tmdb.org/t/p/w500${movieModel.posterPath}',
                                      'https://image.tmdb.org/t/p/w500${state.moviesDetails?.backdropPath}',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${state.moviesDetails?.posterPath}',
                                      width: 120,
                                      height: 160,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    state.moviesDetails?.title ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  color: Colors.white, size: 20),
                              Text(
                                  state.moviesDetails!.releaseDate!.year
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              const VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                              const Icon(Icons.access_time_sharp,
                                  color: Colors.white),
                              Text(
                                '${state.moviesDetails!.runtime} minuts',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                              const Icon(Icons.local_attraction,
                                  color: Colors.white),
                              Text(state.moviesDetails!.voteCount.toString(),
                                  style: const TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TabBar(
                            dividerHeight: 0,
                            unselectedLabelColor: Colors.white,
                            labelColor: Colors.white,
                            indicatorColor: Colors.grey,
                            labelStyle: TextStyle(fontSize: 12),
                            tabs: [
                              Text('Aboute_Movie'),
                              Text('Review'),
                              Text('Cast'),
                            ]),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          child: TabBarView(children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                state.moviesDetails!.overview!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            ReviewWidget(
                              detailsState: state,
                            ),
                            CastWidget(
                              detailsState: state,
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                Status.loading => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  )),
                Status.failed => const Center(
                      child: Text(
                    'Error Details',
                    style: TextStyle(fontSize: 30),
                  )),
                Status.initial => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
              }),
        );
      },
    );
  }
}
