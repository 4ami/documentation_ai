import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:documentation_ai/feature/landing/bloc/events.dart';
import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:documentation_ai/feature/landing/widget/radio_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file_uploader.dart';
import 'neo_container.dart';
import 'uploaded_files_metadata_builder.dart';

class FilesAndRoleBox extends StatefulWidget {
  const FilesAndRoleBox({super.key, this.mobile = false});
  final bool mobile;

  @override
  State<FilesAndRoleBox> createState() => _FilesAndRoleBoxState();
}

class _FilesAndRoleBoxState extends State<FilesAndRoleBox> {
  String role = '';
  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<GenerateBLOC>().state.files;
    return SliverToBoxAdapter(
      child: NeomorphismContainer(
        width: _kWidth,
        height: null,
        verticalMargin: 50,
        radius: 5,
        child: Column(
          children: [
            const FileUploader(),
            const SizedBox(height: 25),
            if (!widget.mobile)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Generate For?',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // ...radioList
                  ...List.from(
                    _radioData.map(
                      (e) => RadioElement(
                        role: e['role'] ?? 'NA',
                        group: role,
                        onChanged: _kOnChanged,
                        title: e['title'] ?? 'NA',
                        subtitle: e['subtitle'] ?? 'NA',
                      ),
                    ),
                  ),
                ],
              )
            else
              ...mobileLayout,
            if (watcher.isNotEmpty)
              UploadedFilesMetadataBuilder(mobile: widget.mobile),
          ],
        ),
      ),
    );
  }

  List<Widget> get mobileLayout {
    return [
      Text(
        'Generate For?',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      ...List.from(
        _radioData.map(
          (e) => RadioElement(
            mobileLayout: true,
            role: e['role'] ?? 'NA',
            group: role,
            onChanged: _kOnChanged,
            title: e['title'] ?? 'NA',
            subtitle: e['subtitle'] ?? 'NA',
          ),
        ),
      ),
    ];
  }

  double get _kWidth {
    final width = MediaQuery.sizeOf(context).width;
    if (widget.mobile) return width - 80;
    return width - 130;
  }

  void Function(String?) get _kOnChanged {
    return (v) {
      if (v != null) {
        setState(() {
          role = v;
        });
        context.read<GenerateBLOC>().add(RoleChanged(role: role));
        Logger.instance.info('Role = $role', location: 'Files Role Box');
      }
    };
  }

  List<Map<String, String>> get _radioData {
    return [
      {
        "role": 'Developer',
        "title": 'Developer',
        "subtitle": 'API Documentation',
      },
      {
        "role": 'CTO',
        "title": 'CTO',
        "subtitle": 'Summary and Security Analysis',
      },
      {
        "role": 'Board Member',
        "title": 'Board Member',
        "subtitle":
            'Executive Summary, Business Value, and Financial Considerations.',
      },
    ];
  }
}
