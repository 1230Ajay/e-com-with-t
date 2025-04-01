import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/custom_shapes/container/circular_container.dart';
import 'package:tapp/core/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    var color = THelperFunctions.getColor(text);
    return ChoiceChip(
      label: color != null ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
      avatar: color != null
          ? TCircullarContainer(
              width: 50,
              height: 50,
              backGroundColor: color,
            )
          : null,
      shape: color != null ? CircleBorder() : null,
      labelPadding: color != null ? EdgeInsets.all(0) : null,
      padding: color != null ? EdgeInsets.all(0) : null,
      selectedColor: color,
      backgroundColor: color,
    );
  }
}
