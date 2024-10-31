import 'package:flutter/material.dart';
import 'package:hackpay/shared/assets.dart';

import 'svg_icon.dart';

class HackPayBackButton extends StatelessWidget {
  const HackPayBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (!Navigator.of(context).canPop()) return const SizedBox.shrink();

    return IconButton(
      key: const Key('backButton'),
      onPressed: onTap ?? Navigator.of(context).maybePop,
      tooltip: 'Back',
      icon: const SvgIcon(ImageAssets.arrowLeft),
    );
  }
}
