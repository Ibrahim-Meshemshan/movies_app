import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/initial_page/home_screen/page/bloc/home_bloc.dart';
import '../../../../../core/Theme/Theme_manager.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem({super.key, required this.state, required this.selectedGenre});

  final HomeState state;
  final ValueNotifier<int> selectedGenre;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.08,
      width: double.infinity,
      child: ValueListenableBuilder<int>(
        valueListenable: selectedGenre,
        builder: (BuildContext context, int value, Widget? child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (state.genres?.length ?? 0) + 1,
            itemBuilder: (context, index) {
              final bool isSelected = selectedGenre.value == index;

              return InkWell(
                onTap: () {
                  selectedGenre.value = index;
                  if (index == 0) {
                    context.read<HomeBloc>().add(GetMoviesEvent());
                  } else {
                    final genreId =
                        state.genres?[index - 1].id?.toString() ?? '';
                    context
                        .read<HomeBloc>()
                        .add(GetMoviesEvent(genreId: genreId));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.blue
                        : ThemeManager.searchColor,

                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    index == 0 ? 'All' : state.genres?[index - 1].name ?? '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isSelected
                          ? ThemeManager.whiteColor
                          : ThemeManager.selectIcon,

                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
