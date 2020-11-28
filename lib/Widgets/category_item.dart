import 'package:flutter/material.dart';
import 'package:meals_app/Screen/category_meal_screen.dart';


class CategoryItem extends StatelessWidget {

  final String title;
  final Color color;
  final String id;
  CategoryItem(this.id,this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(CategoryMealScreen.routeName,arguments: {'id':id,'title':title});
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
          child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style:Theme.of(context).textTheme.headline3 ,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
