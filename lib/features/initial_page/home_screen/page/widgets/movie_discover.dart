import 'package:flutter/material.dart';

import 'package:movies_app/features/initial_page/home_screen/page/bloc/home_bloc.dart';

import '../../../details_screen/page/screen/details_screen.dart';

class MovieDiscover extends StatelessWidget {
  const MovieDiscover({super.key, required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: state.movie?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 12,
            childAspectRatio: 2 / 3,
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              final movieId = state.movie?[index].id;
              if (movieId != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(id: state.movie![index].id.toString())
                  ),
                );
              } else {
                print('Movie ID is null or invalid');
              }
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(bottom: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${state.movie?[index]
                      .posterPath!}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
