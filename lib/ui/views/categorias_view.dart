import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/categories_modals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriasView extends StatefulWidget {
  const CategoriasView({super.key});

  @override
  State<CategoriasView> createState() => _CategoriasViewState();
}

class _CategoriasViewState extends State<CategoriasView> {
  int _rowsPapers = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CategoriesProvider>(context).categories;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Categorias View',
            style: CustomLabel.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS(data, context),
            header: const Text('Categorias Disponibles'),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPapers = value ?? 10;
              });
            },
            rowsPerPage: _rowsPapers,
            actions: [
              CustomIconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      constraints: const BoxConstraints.expand(height: 500),
                      context: context,
                      builder: (_) => const CategoryModals(categoria: null));
                  },
                  text: "Crear",
                  icon: Icons.add_outlined)
            ],
          )
        ],
      ),
    );
  }
}
