import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/catogory.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categories = [];

  getCategories() async {
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    categories = [...categoriesResponse.categorias];

    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {'nombre': name};

    try {
      final resp = await CafeApi.httpPost('/categorias', data);
      final newcategory = Categoria.fromMap(resp);

      categories.add(newcategory);
      notifyListeners();
    } catch (e) {
      throw 'Error al generar la categoria';
    }
  }

  Future putCategory(String name, String id) async {
    final data = {'nombre': name};

    try {
      await CafeApi.httpPut("/categorias/$id", data);
      final categoria = categories.firstWhere(
        (element) => element.id == id,
      );
      categoria.nombre = name;
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar la categoria';
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.httpDelete("/categorias/$id");

      categories.removeWhere((element) => element.id == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
