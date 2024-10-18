import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/location/location_cubit.dart';

class OnboardingCity extends StatefulWidget {
  const OnboardingCity({required this.onSubmit, super.key});
  final void Function(String) onSubmit;

  @override
  State<OnboardingCity> createState() => _OnboardingCityState();
}

class _OnboardingCityState extends State<OnboardingCity> {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<bool> _isSkippable = ValueNotifier<bool>(true);
  final FocusNode _focusNode = FocusNode();

  late LocationCubit _locationCubit;

  @override
  void initState() {
    _locationCubit = GetIt.I<LocationCubit>();
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        _isSkippable.value = false;
      } else {
        _isSkippable.value = true;
      }
    });
    // TODO: implement initState
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
    return BlocListener<LocationCubit, LocationState>(
      bloc: _locationCubit,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (city) {
            _controller.text = city;
          },
          failure: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Currently we cannot fetch your location'),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Enter your city name'),
              controller: _controller,
              focusNode: _focusNode,
              onTapOutside: (event) {
                _focusNode.unfocus();
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
              ],
            ),
            TextButton(
              onPressed: _locationCubit.getLocation,
              child: const Text(
                'Auto Fill',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ValueListenableBuilder(
              valueListenable: _isSkippable,
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () {
                    widget.onSubmit(_controller.text);
                  },
                  child: Center(
                    child: Text(
                      value ? 'Skip' : 'Submit',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
