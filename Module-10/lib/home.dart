import 'package:flutter/material.dart';
import 'package:module10/verticalView.dart';

import 'horizontalView.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (orientation == Orientation.portrait) {
                // Vertical View
                return buildVerticalLayout(constraints,context);
              } else {
                // Horizontal View
                return buildHorizontalLayout(constraints,context);
              }
            },
          );
        },
      ),
    );
  }




}
