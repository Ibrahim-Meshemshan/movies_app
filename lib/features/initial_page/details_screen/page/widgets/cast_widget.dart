import 'package:flutter/material.dart';
import 'package:movies_app/core/exception/status.dart';

import '../../../home_screen/page/bloc/home_bloc.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key, required this.detailsState});

  final HomeState detailsState;

  @override
  Widget build(BuildContext context) {
    if (detailsState.creditsStatus == Status.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    } else if (detailsState.creditsStatus == Status.failed) {
      return const Center(
        child: Text(
          'Error Cridet',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      );
    }else if(detailsState.creditsStatus == Status.success){
      return GridView.builder(
        itemCount: detailsState.cast?.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return  Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: detailsState.cast?[index].profilePath != null

                    ? NetworkImage('https://image.tmdb.org/t/p/w500${detailsState.cast![index].profilePath!}')
                    : const AssetImage('assets/images/Movie (3).png'),
              ),
              SizedBox(height: 10),
              Text(
                detailsState.cast![index].name!,
                style: TextStyle(color: Colors.white),
              )
            ],
          );
        },
      );
    }return Text('data Source Cridet',style: TextStyle(color: Colors.white,fontSize: 30),);
  }
}

