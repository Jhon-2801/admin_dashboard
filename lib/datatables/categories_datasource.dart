import 'package:admin_dashboard/models/catogory.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/categories_modals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Categoria> categoria;
  final BuildContext context;
  CategoriesDTS(this.categoria, this.context);
  @override
  DataRow getRow(int index) {
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    final category = categoria[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(category.id)),
      DataCell(Text(category.nombre)),
      DataCell(Text(category.usuario.nombre)),
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => CategoryModals(
                          categoria: category,
                        ));
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text('Estas seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${category.nombre}?'),
                  surfaceTintColor: null,
                  actions: [
                    TextButton(
                        onPressed: () async {
                          await categoriesProvider.deleteCategory(category.id);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Si')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              },
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ))
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categoria.length;

  @override
  int get selectedRowCount => 0;
}
