import 'package:flutter/material.dart';

class NothingButton extends StatelessWidget {
  const NothingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pushNamed('/create');
      },
      icon: Container(
        color: Colors.white,
        child: const Center(
          child: Icon(
            Icons.add_circle_outline_rounded,
            size: 100,
            color: Colors.black,
            )
            )
            )
      );
  }
}
