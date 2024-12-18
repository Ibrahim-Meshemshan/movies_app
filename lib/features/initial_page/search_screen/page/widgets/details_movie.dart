import 'package:flutter/material.dart';

import '../../../../../core/Theme/Theme_manager.dart';
import '../../data/model/search_response_model.dart';
import 'details_search.dart';


class DetailsMovie extends StatelessWidget {
  const DetailsMovie({super.key,required this.searchModel});

 final Result searchModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.3,
          height:  MediaQuery.of(context).size.height *0.22,
          child: searchModel.posterPath != null && searchModel.posterPath!.isNotEmpty
              ? Image.network(
            'https://image.tmdb.org/t/p/w500${searchModel.posterPath}',
            fit: BoxFit.contain,
          )
              : const Icon(
            Icons.image_not_supported,
            color: ThemeManager.whiteColor,
            size: 50,
          ),
        ),
        const SizedBox(width: 10),
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                searchModel.title?? " ",
                style: const TextStyle(color: ThemeManager.whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DetailsSearch(icon: Icons.star, text: searchModel.voteAverage.toString(), color: ThemeManager.orangeColor),
              const SizedBox(height: 5),
              DetailsSearch(icon: Icons.list, text: searchModel.originalLanguage.toString(), color: ThemeManager.whiteColor),
              const SizedBox(height: 5),
              DetailsSearch(icon: Icons.calendar_today, text: searchModel.releaseDate.toString(), color: ThemeManager.whiteColor),
              const SizedBox(height: 5),
              DetailsSearch(icon: Icons.access_time_outlined, text: searchModel.id.toString(), color: ThemeManager.whiteColor),
            ],
          ),
        ),
      ],
    );
  }
}
