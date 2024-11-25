import 'package:flutter/material.dart';

// Multi-select chip widget
class MultiSelectChip extends StatefulWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectChip({
    Key? key,
    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.options.map((option) {
        final isSelected = widget.selectedOptions.contains(option);
        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                widget.selectedOptions.add(option);
              } else {
                widget.selectedOptions.remove(option);
              }
              widget.onSelectionChanged(widget.selectedOptions);
            });
          },
        );
      }).toList(),
    );
  }
}