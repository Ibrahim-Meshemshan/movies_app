import 'package:flutter/material.dart';
import 'package:movies_app/core/exception/status.dart';
import 'package:movies_app/features/initial_page/home_screen/page/bloc/home_bloc.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.detailsState});

  final HomeState detailsState;

  @override
  Widget build(BuildContext context) {
    print('Current reviewStatus: ${detailsState.reviewStatus}');
    print('Reviews: ${detailsState.review}');
    if (detailsState.reviewStatus == Status.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    } else if (detailsState.reviewStatus == Status.failed) {
      return const Center(
        child: Text(
          'Error Review',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      );
    } else if (detailsState.reviewStatus == Status.success) {
      return Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView.builder(
          itemCount: detailsState.review?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                detailsState.review![index].author!,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  style: TextStyle(color: Colors.white70),
                  detailsState.review![index].content!),
              //'https://image.tmdb.org/t/p/w500'
              leading: CircleAvatar(
                backgroundImage: detailsState.review?[index].url != null
                    ? NetworkImage(detailsState.review![index].url!)
                    : const AssetImage('assets/images/Movie (3).png'),
              ),
            );
          },
        ),
      );
    }
    return const Text(
      'data Source review',
      style: TextStyle(color: Colors.white, fontSize: 30),
    );
  }
}
