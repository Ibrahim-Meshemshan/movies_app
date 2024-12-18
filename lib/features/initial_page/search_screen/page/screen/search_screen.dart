import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/exception/status.dart';
import '../bloc/search_bloc.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/details_movie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(),
                const SizedBox(height: 30),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state.status == Status.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    } else if (state.status == Status.failed) {
                      return const Center(
                          child: Text(
                            "Error ---------------",
                            style: TextStyle(color: Colors.white),
                          ));
                    } else {
                      return SizedBox(
                        height: 590,
                        child: ListView.builder(
                          itemCount: state.result.length,
                          itemBuilder: (context, index) {
                            return DetailsMovie(
                              searchModel: state.result[index],
                            );
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
