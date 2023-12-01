import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  mainDrawer({super.key, required this.onSelectScreen});

  void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primary.withOpacity(0.6),
                ]),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    color: Theme.of(context).colorScheme.primary,
                    size: 60,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text('Meals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground)),
            onTap: () {
              onSelectScreen('Meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text('Filters',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onBackground)),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
