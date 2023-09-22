import 'package:bloc_demo/ui/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {

  final bool selected;
  final double? height;
  final double? width;
  final Function(bool) onChanged;

  const CustomCheckbox({
    Key? key,
    required this.selected,
    required this.onChanged,
    this.height = 24,
    this.width = 24,
  }) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {

  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
        widget.onChanged(_selected);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selected ? Colors.green : Colors.white,
          border: Border.all(color: _selected ? Colors.transparent : Styles.blue1, width: 2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: _selected ? const Icon(
            Icons.check,
            size: 16,
            color: Colors.white,
          ) : Container(),
        ),
      ),
    );
  }
}
