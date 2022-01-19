import 'package:flutter/material.dart';
import '../providers/new_provider.dart';
import 'package:provider/provider.dart';

class NewDetailScreen extends StatelessWidget {
  static const routeName = "/new_detail";
  @override
  Widget build(BuildContext context) {
    final newId = ModalRoute.of(context).settings.arguments as String;
    final selectedNew = Provider.of<NewProvider>(context)
        .items
        .firstWhere((test) => test.id == newId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedNew.date_publication.toIso8601String()),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
