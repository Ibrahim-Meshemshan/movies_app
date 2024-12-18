part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class GetWishListEvent extends WishlistEvent {}
class AddWishListEvent extends WishlistEvent {
  final MovieDetailsResponseModel movieDetailsResponseModel;
  AddWishListEvent({required this.movieDetailsResponseModel});
}
class RemoveWishListEvent extends WishlistEvent {
  final int id;
  RemoveWishListEvent({required this.id});
}