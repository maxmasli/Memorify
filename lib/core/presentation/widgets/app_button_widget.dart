import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).colorScheme.secondary,
      ),
      //width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Material(
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(text, style: Theme.of(context).textTheme.bodyMedium),
              InkWell(
                onTap: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
