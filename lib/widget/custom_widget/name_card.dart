import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameCard extends StatefulWidget {
  final String name;
  final void Function(String) onSubmit;
  const NameCard({
    super.key,
    required this.onSubmit,
    required this.name,
  });

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.text = widget.name;
    super.initState();
  }

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
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade300,
        ),
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
