import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: UnconstrainedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: SizedBox(
            width: 277,
            height: 58,
            child: FilledButton(
              style: ButtonStyle(shape: _kBS),
              onPressed: _isEnable(context),
              child: Text(
                'Submit To Start',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Function()? _isEnable(BuildContext context) {
    final watcher = context.watch<GenerateBLOC>().state;
    if (watcher.files.isEmpty) return null;
    if (watcher.role.isEmpty) return null;
    return _kOnPressed;
  }

  void Function() get _kOnPressed {
    return () {};
  }

  MaterialStatePropertyAll<OutlinedBorder?> get _kBS {
    return MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
