import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/repository_model.dart';
import '../utils/constants.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel repository;

  const RepositoryCard({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {

    final formattedDate = DateFormat(
      'yyyy.MM.dd',
    ).format(
      repository.updatedAt,
    );

    return Card(
      child: Padding(
        padding: const .all(Constants.defaultPadding),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(repository.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: Constants.defaultPadding),
            Text(repository.description ?? Constants.noDescriptionText, style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white)),
            const SizedBox(height: Constants.defaultPadding),
            Text(
              'Updated: $formattedDate',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
