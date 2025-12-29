import 'package:flutter/material.dart';
import 'package:crypto_trading_lessons/core/constants/index.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsTile> tiles;

  const SettingsSection({super.key, required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
            vertical: AppConstants.paddingSmall,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
        ...tiles.asMap().entries.map((entry) {
          final isLast = entry.key == tiles.length - 1;
          return _TileWidget(tile: entry.value, isLast: isLast);
        }),
        const SizedBox(height: AppConstants.paddingMedium),
      ],
    );
  }
}

class SettingsTile {
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool showDivider;

  SettingsTile({
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
    this.trailing,
    this.showDivider = true,
  });
}

class _TileWidget extends StatelessWidget {
  final SettingsTile tile;
  final bool isLast;

  const _TileWidget({required this.tile, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tile.onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingMedium,
                vertical: AppConstants.paddingMedium,
              ),
              child: Row(
                children: [
                  Icon(tile.icon, color: AppColors.primary, size: 24),
                  const SizedBox(width: AppConstants.paddingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tile.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        if (tile.subtitle != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: AppConstants.paddingSmall,
                            ),
                            child: Text(
                              tile.subtitle!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (tile.trailing != null) tile.trailing!,
                  if (tile.trailing == null)
                    const Icon(Icons.chevron_right, color: AppColors.primary),
                ],
              ),
            ),
            if (!isLast && tile.showDivider)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                ),
                child: Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
              ),
          ],
        ),
      ),
    );
  }
}
