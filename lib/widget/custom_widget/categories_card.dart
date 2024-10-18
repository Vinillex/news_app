import 'package:flutter/material.dart';

class CategoriesCard extends StatefulWidget {
  const CategoriesCard({
    required this.onSubmit,
    required this.selectedCategories,
    super.key,
  });
  final void Function(List<String>) onSubmit;
  final List<String> selectedCategories;

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  final ValueNotifier<String?> _valueNotifier = ValueNotifier<String?>(null);

  final List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  List<String> selectedCategories = List.empty(growable: true);

  @override
  void initState() {
    selectedCategories.addAll(widget.selectedCategories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            children: [
              ...List.generate(categories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      if (selectedCategories.contains(categories[index])) {
                        if (selectedCategories.length > 2) {
                          selectedCategories.remove(categories[index]);
                          _valueNotifier.value = null;
                        } else {
                          _valueNotifier.value =
                              'You have to atleast select 2 categories';
                        }
                      } else {
                        if (selectedCategories.length == 4) {
                          _valueNotifier.value =
                              'You can only select 4 categories';
                        } else {
                          _valueNotifier.value = null;
                          selectedCategories.add(categories[index]);
                        }
                      }
                      setState(() {});
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: selectedCategories.contains(categories[index])
                              ? Colors.purple.shade100
                              : Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ValueListenableBuilder(
            valueListenable: _valueNotifier,
            builder: (context, value, child) {
              if (value == null) {
                return const SizedBox.shrink();
              } else {
                return Text(value);
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              _valueNotifier.value = null;
              widget.onSubmit(selectedCategories);
            },
            child: const Center(
              child: Text(
                'Submit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
