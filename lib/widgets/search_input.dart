import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchInput({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onSubmitted: (_) => onSearch(),
          textInputAction: .search,
          decoration: const InputDecoration(
            hintText: Constants.searchHintText,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: Constants.defaultPadding),
        SizedBox(
          width: .infinity,
          child: ElevatedButton(
            onPressed: onSearch,
            child: const Text(Constants.searchButtonText),
          ),
        ),
      ],
    );
  }
}
