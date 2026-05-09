import 'package:flutter/material.dart';

import '../models/repository_model.dart';
import '../utils/constants.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel repository;

  const RepositoryCard({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(repository.name),
        subtitle: Text(repository.description ?? Constants.noDescriptionText),
      ),
    );
  }
}
