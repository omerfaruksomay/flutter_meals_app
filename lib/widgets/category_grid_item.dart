import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('12', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
          Text('1', style: TextStyle(color: Colors.white)),
        ]);
  }
}
