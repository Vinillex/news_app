import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingName extends StatefulWidget {
  const OnboardingName({
    required this.onSubmit,
    super.key,
  });
  final void Function(String) onSubmit;

  @override
  State<OnboardingName> createState() => _OnboardingNameState();
}

class _OnboardingNameState extends State<OnboardingName> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              onTapOutside: (event) {
                _focusNode.unfocus();
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
              validator: (value) {
                if (value == null) {
                  return 'Please enter your name';
                }
                if (value == '') {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit(_controller.text);
                }
              },
              child: const Center(
                child: Text(
                  'Submit',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
