import 'package:flutter/material.dart';

class BlockButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  final style = ElevatedButton.styleFrom(
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  BlockButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: style, onPressed: onPressed, child: Text(label)),
      ),
    );
  }
}
