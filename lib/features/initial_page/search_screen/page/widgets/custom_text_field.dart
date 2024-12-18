import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Theme/Theme_manager.dart';
import '../bloc/search_bloc.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (text) {
                context.read<SearchBloc>().add(PageSearchEvent(text: text));
              },
              controller: searchController,
              cursorColor: ThemeManager.whiteColor,
              style: ThemeManager.nightTheme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                filled: true,
                fillColor: ThemeManager.searchColor,
                focusColor: ThemeManager.searchColor,
                hintText: 'Search',
                hintStyle: const TextStyle(color: ThemeManager.whiteColor),
                suffixIcon: InkWell(
                  onTap: () {
                    context
                        .read<SearchBloc>()
                        .add(PageSearchEvent(text: searchController.text));
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
