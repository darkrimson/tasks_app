// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import 'package:tasks_app/models/task.dart';
import 'package:tasks_app/providers/color_provider.dart';

class SetColorWidget extends StatelessWidget {
  const SetColorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ColorProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Select Color:'),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Select Color'),
                content: SingleChildScrollView(
                  child: BlockPicker(
                    availableColors: const [
                      Colors.white,
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                      Colors.yellow,
                      Colors.purple,
                    ],
                    pickerColor: provider.selectedColor,
                    onColorChanged: (selectedColor) {
                      provider.setSelectedColor(selectedColor);
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            );
          },
          child: Consumer<ColorProvider>(
            builder: (context, provider, child) {
              return Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: provider.selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
