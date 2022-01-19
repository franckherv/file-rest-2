import 'package:flutter/material.dart';
import 'package:food_app_project/dummy_data.dart';
import 'package:food_app_project/models/meals.dart';
import 'package:food_app_project/screen/categorie_screen.dart';
import 'package:food_app_project/screen/filter_screen.dart';
import 'package:food_app_project/screen/meal_detail_screen.dart';
import './screen/tabs_screen.dart';



void main() {
  runApp(MyApp());
}


 

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
      ),
      home: TabsCreen(),
      routes: {
        MealDetailScreen.routeName: (cxt) => MealDetailScreen(),
        CategoryScreenMeals.routeName : (cxt) => CategoryScreenMeals(_availableMeals),
        FilterScreen.routeName : (cxt) => FilterScreen()
      },
    );

    
  }
}


