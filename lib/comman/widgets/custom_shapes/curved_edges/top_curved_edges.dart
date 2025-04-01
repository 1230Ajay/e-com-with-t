import 'package:flutter/material.dart';
import 'package:tapp/comman/widgets/custom_shapes/curved_edges/top_cureved_edges.dart';

class TopCurvedEdgesWidget extends StatelessWidget {
  const TopCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopCustomCurvedEdges(),
      child: child,
    );
  }
}
