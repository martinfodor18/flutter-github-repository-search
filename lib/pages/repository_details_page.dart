import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/repository_model.dart';
import '../utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final RepositoryModel repository;

  const RepositoryDetailsPage({super.key, required this.repository});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);

    await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  }

  @override
  Widget build(BuildContext context) {
    final createdAt = DateFormat('yyyy.MM.dd').format(repository.createdAt);

    final updatedAt = DateFormat('yyyy.MM.dd').format(repository.updatedAt);

    return Scaffold(
      appBar: AppBar(title: const Text(Constants.repositoryText)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              repository.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: Constants.defaultPadding),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(repository.ownerAvatarUrl),
                ),
                SizedBox(width: Constants.defaultPadding),
                Text(
                  repository.ownerName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),

            const SizedBox(height: Constants.largePadding),

            Text(
              repository.description ?? Constants.noDescriptionText,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            _InfoRow(label: Constants.forksText, value: repository.forksCount.toString()),

            const SizedBox(height: 16),

            _InfoRow(label: Constants.createdText, value: createdAt),

            const SizedBox(height: 16),

            _InfoRow(label: Constants.updatedText, value: updatedAt),

            const SizedBox(height: Constants.defaultPadding),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _openUrl(repository.ownerProfileUrl);
                    },

                    child: const Text(Constants.profileButtonText),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _openUrl(repository.repositoryUrl);
                    },

                    child: const Text(Constants.repositoryText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w700)),

        Expanded(child: Text(value)),
      ],
    );
  }
}
