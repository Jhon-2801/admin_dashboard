import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankdView extends StatelessWidget {
  const BlankdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabel.h1,),
          const SizedBox(height: 10,),
          const WhiteCard(title: 'Sales Static',child: Text('Esto es un tarea'))
        ],
      ),
    );
  }
}
