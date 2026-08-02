import 'package:flutter/material.dart';
import 'package:news/core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../articles/presntation/screen/articles_widget.dart';
import '../../../categories/data/model/category_model.dart';
import '../../../categories/presentation/screen/categories_widget.dart';
import '../widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
            onPressed:() {
              Navigator.pushNamed(context,RoutesManager.searchRouteName);
            } , icon:Icon(Icons.search))],
        title: Text(
          selectedCategory == null
              ? StringsManager.home
              : selectedCategory!.title,
        ),
      ),
      drawer: HomeDrawer(backHome),
      body: selectedCategory == null
          ? CategoriesWidget(onClick: chooseCategory)
          : ArticlesWidget(selectedCategory!),
    );
  }

  chooseCategory(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  backHome() {
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
