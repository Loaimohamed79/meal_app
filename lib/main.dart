import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import './Screen/Filter_screen.dart';
import './Screen/tabs_screen.dart';
import './Screen/meal_details_screen.dart';
import 'Screen/category_meal_screen.dart';
import 'model/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _avalibleMeals = DUMMY_MEALS;
  List<Meal> _favoriateMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _avalibleMeals = DUMMY_MEALS.where((element) {
        if (_filter['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _togglefavourite(String mealId) {
    final existingIndex =
        _favoriateMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriateMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriateMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }
  bool _isFavoriteMeal(String id){
  return  _favoriateMeals.any((element) => element.id==id);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: themedata,
      routes: {
        '/': (context) => TabScreen(_favoriateMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_avalibleMeals),
        '/MealDetailsScreen': (context) => MealDetailsScreen(_togglefavourite,_isFavoriteMeal),
        '/Filter': (context) => FilterScreen(_setFilter, _filter),
      },
    );
  }
}
