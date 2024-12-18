import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../core/exception/status.dart';
import '../../details_screen/data/model/movie_details_response_model.dart';


part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState()) {
    on<GetWishListEvent>((event, emit) {
      emit(state.copyWith(
          wishlistMovies:
              Hive.box<MovieDetailsResponseModel>('wishlist').values.toList()));
    });

    on<AddWishListEvent>((event, emit) async {
      await Hive.box<MovieDetailsResponseModel>('wishlist').put(
          event.movieDetailsResponseModel.id, event.movieDetailsResponseModel);
      add(GetWishListEvent());
    });

    on<RemoveWishListEvent>((event, emit) async {
      await Hive.box<MovieDetailsResponseModel>('wishlist').delete(event.id);
      add(GetWishListEvent());
    });
  }
}
