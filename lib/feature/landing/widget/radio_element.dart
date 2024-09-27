import 'package:flutter/material.dart';

class RadioElement extends StatefulWidget {
  const RadioElement({
    super.key,
    required this.role,
    required this.group,
    required this.onChanged,
    required this.title,
    required this.subtitle,
    this.mobileLayout = false,
  });

  final String role, group, title, subtitle;
  final void Function(String?) onChanged;
  final bool mobileLayout;

  @override
  State<RadioElement> createState() => _RadioElementState();
}

class _RadioElementState extends State<RadioElement> {
  @override
  Widget build(BuildContext context) {
    return child;
  }

  Widget get child {
    if (widget.mobileLayout) return mobile;
    return desktop;
  }

  Widget get desktop {
    return Expanded(
      child: ListTile(
        leading: Radio<String>.adaptive(
          value: widget.role,
          groupValue: widget.group,
          onChanged: widget.onChanged,
          fillColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.scrim),
        ),
        title: Text(widget.title, style: _kTitleStyle),
        subtitle: Text(widget.subtitle),
      ),
    );
  }

  Widget get mobile {
    return ListTile(
      leading: Radio<String>.adaptive(
        value: widget.role,
        groupValue: widget.group,
        onChanged: widget.onChanged,
        fillColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.scrim),
      ),
      title: Text(widget.title, style: _kTitleStyle),
      subtitle: Text(widget.subtitle),
    );
  }

  TextStyle? get _kTitleStyle {
    return Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.bold);
  }
}
