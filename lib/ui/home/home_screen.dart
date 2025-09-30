import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';
import 'package:news_c16_sun/data/models/category_dm.dart';
import 'package:news_c16_sun/ui/home/pages/categories_page.dart';
import 'package:news_c16_sun/ui/home/pages/news_page.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarTitle = "Home";
  int index = -1;
  CategoryDm? categoryDm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: AppColors.white,
              child: Center(
                child: Text(
                  "News App",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              onTap: () {
                setState(() {
                  index = -1;
                });
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: AppColors.white,
        title: Text(appBarTitle),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        centerTitle: true,
      ),
      body: index == -1 ? CategoriesPage(onCardClick: changePage,) : NewsPage(categoryDm: categoryDm!,),
    );
  }

  void changePage(int index , CategoryDm category) {
    this.index = index;
    categoryDm = category;
    appBarTitle = categoryDm!.name;
    setState(() {});
  }
}
