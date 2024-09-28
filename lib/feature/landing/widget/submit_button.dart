import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:documentation_ai/feature/landing/bloc/events.dart'; // Add this to handle events
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

  // Enable the button only if files and role are selected
  void Function()? _isEnable(BuildContext context) {
    final watcher = context.watch<GenerateBLOC>().state;
    if (watcher.files.isEmpty) return null;
    if (watcher.role.isEmpty) return null;
    return () => context
        .read<GenerateBLOC>()
        .add(SubmitEvent()); // Trigger the SubmitEvent
  }

  MaterialStatePropertyAll<OutlinedBorder?> get _kBS {
    return MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
