import 'package:flutter/material.dart';

class AppSmallButtonWidget extends StatelessWidget {
  const AppSmallButtonWidget({
    required this.child,
    required this.onTap,
    super.key,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                overlayColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary,
                ),
                onTap: onTap,
              ),
            ),
          )
        ],
      ),
    );
  }
}
