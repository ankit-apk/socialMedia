import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class ProfileContainers extends StatelessWidget {
  const ProfileContainers({
    @required this.iconData,
    @required this.name,
    Key? key,
  }) : super(key: key);

  final String? name;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GlassContainer.clearGlass(
        height: 100,
        width: 100,
        borderWidth: 0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.white.withOpacity(0.5),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                name!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
