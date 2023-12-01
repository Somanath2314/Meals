import 'package:meals/models/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavoriteMealsProvider extends StateNotifier<List<Meal>> {
  FavoriteMealsProvider() : super([]);

  bool toggleFavoritesStatus(Meal meal) {
    final mealIsFaV = state.contains(meal);
    if (mealIsFaV) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsProvider, List<Meal>>(
        (ref) => FavoriteMealsProvider());
