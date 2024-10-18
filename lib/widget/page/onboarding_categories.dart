import 'package:flutter/material.dart';

class OnboardingCategories extends StatefulWidget {
  const OnboardingCategories({
    required this.onSubmit,
    super.key,
  });
  final void Function(List<String>) onSubmit;

  @override
  State<OnboardingCategories> createState() => _OnboardingCategoriesState();
}

class _OnboardingCategoriesState extends State<OnboardingCategories> {
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

  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      selectedCategories.remove(categories[index]);
                      _valueNotifier.value = null;
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
                      borderRadius: BorderRadius.circular(12),
                    ),
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
            if (selectedCategories.length < 2) {
              _valueNotifier.value = 'Please select atleast 2 categories';
            } else {
              _valueNotifier.value = null;
              widget.onSubmit(selectedCategories);
            }
          },
          child: const Center(
            child: Text(
              'Submit',
            ),
          ),
        ),
      ],
    );
  }
}
