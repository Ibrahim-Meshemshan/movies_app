import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_app/features/initial_page/home_screen/page/bloc/home_bloc.dart';

class TopRatedWidget extends StatefulWidget {
  const TopRatedWidget({super.key, required this.state});

  final HomeState state;

  @override
  _TopRatedWidgetState createState() => _TopRatedWidgetState();
}

class _TopRatedWidgetState extends State<TopRatedWidget> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (widget.state.topRated != null && widget.state.topRated!.isNotEmpty) {
        _currentPage = (_currentPage + 1) % widget.state.topRated!.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.28,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.state.topRated?.length ?? 0,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.28,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.network(
                      width: double.infinity,
                      'https://image.tmdb.org/t/p/w500${widget.state.topRated?[index].posterPath!}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
