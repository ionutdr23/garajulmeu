import 'package:flutter/material.dart';

enum AppButtonType { primary, secondary, destructive }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonType type;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final backgroundColor = switch (type) {
      AppButtonType.primary => colorScheme.primary,
      AppButtonType.secondary => colorScheme.surfaceContainer,
      AppButtonType.destructive => const Color(0xFFFF5555),
    };

    final textColor = switch (type) {
      AppButtonType.primary => colorScheme.onPrimary,
      AppButtonType.secondary => colorScheme.onSurface,
      AppButtonType.destructive => Colors.white,
    };

    final style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: type == AppButtonType.secondary
            ? BorderSide(color: colorScheme.primary, width: 1.5)
            : BorderSide.none,
      ),
      elevation: 4,
      shadowColor: backgroundColor.withValues(alpha: 0.4),
    );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(text),
        style: style,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(text),
    );
  }
}
