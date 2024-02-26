import 'package:flutter/material.dart';

abstract class AppColors {
  static const gray = Color(0xff60607b); // data and buttons
  static const lightGray = Color(0xffb5b5b5); // strikethrough
  static const red = Color(0xffff0000); // red text
  static const white = Colors.white; // background
  static const brightGray = Color(0xfff1f1f1); // filter button background
  static const lime = Color(0xff67cD00); // background buttons
}

abstract class AppStrings {
  //Common
  static const rub = 'руб';
  //EmptyScreen
  static const emptyText = 'Здесь ничего нет';
  //ShoppingListTitle
  static const shoppingListTitle = 'Список покупок';
  //ShoppingList
  static const oneItem = 'товар';
  static const manyItems = 'товаров';
  static const inYourPurchase = 'В вашей покупке';
  static const discount = 'Cкидка';
  static const sumWithDiscount = 'Итого';
  //BottomNavigationBar
  static const catalog = 'Каталог';
  static const search = 'Поиск';
  static const basket = 'Корзина';
  static const personal = 'Личное';
  //SortTypeBottomSheet
  static const sortTypeBottomSheetTitle = 'Сортировка';
  static const nameSortTitle = 'По имени';
  static const priceSortTitle = 'По цене';
  static const categorySortTitle = 'По категории';
  static const notSorted = 'Без сортировки';
  static const byNameAsc = 'По имени от А до Я';
  static const byNameDesc = 'По имени от Я до А';
  static const byPriceAsc = 'По возрастанию';
  static const byPriceDesc = 'По убыванию';
  static const byTypeAsc = 'По типу от А до Я';
  static const byTypeDesc = 'По типу от Я до А';
  static const sortTypeBottomSheetButton = 'Готово';
  //ProductList
  static const weight = 'кг';
  static const item = 'шт';
}

abstract class AppTextStyle {

  //Colored text
  static const redStyle =  TextStyle(color: AppColors.red,);
  static const whiteStyle = TextStyle(color: AppColors.white);

  static const grayLineThroughStyle = TextStyle(
    color: AppColors.lightGray,
    decoration: TextDecoration.lineThrough,);
  //10
  static const gray10Style = TextStyle(
      fontSize: 10,
      color: AppColors.gray);
  //12
  static const noColor12Style = TextStyle(fontSize: 12);

  static const boldBlack12Style = TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  //16
  static const noColor16Style = TextStyle(fontSize: 16);

  static const boldBlack16Style = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  //18
  static const noColor18Style = TextStyle(fontSize: 18);

  static const boldBlack18Style = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  //24
  static const boldBlack24Style = TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold);

}

