import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/bloc/location/location_cubit.dart';

class CityCard extends StatefulWidget {
  const CityCard({required this.onSubmit, super.key, this.city});
  final String? city;
  final void Function(String) onSubmit;

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late LocationCubit _locationCubit;

  @override
  void initState() {
    if (widget.city != null) {
      _controller.text = widget.city!;
    }
    _locationCubit = GetIt.I<LocationCubit>();
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
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade300,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your city name'
                ),
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
                    return 'Please enter your city';
                  }
                  if (value == '') {
                    return 'Please enter your city';
                  }
                  return null;
                },
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
      ),
    );
  }
}
