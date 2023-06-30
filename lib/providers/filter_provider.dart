import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);

final FilteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activceFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activceFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activceFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activceFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activceFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
