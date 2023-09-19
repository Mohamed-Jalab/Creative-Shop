// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ItemFavoriteCubit extends Cubit<ItemFavoriteState> {
  ItemFavoriteCubit({required this.isFavorite}) : super(ItemFavoriteInitial());

  static ItemFavoriteCubit get(context) => BlocProvider.of(context);
  bool isFavorite;

  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteItemState());
  }
}
