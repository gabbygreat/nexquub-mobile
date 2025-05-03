import 'package:nexquub/utils/utils.dart';

enum BottonNavItems { home, library, chat, settings }

class CustomDrawer extends StatelessWidget {
  final int index;
  final void Function(int) onChanged;

  const CustomDrawer({super.key, required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDark;
    return Drawer(
      backgroundColor: isDark ? PakeColors.bnbBg : PakeColors.bgLight,
      child: Column(
        children: [
          10.sbH,
          CircleAvatar(radius: 40.spMin),
          30.sbH,
          Expanded(
            child: ListView(
              children: [
                ...BottonNavItems.values.map((e) {
                  final position = BottonNavItems.values.indexOf(e);
                  bool selected = index == position;
                  return ListTile(
                    selected: selected,
                    selectedTileColor: PakeColors.primaryDark400,
                    onTap: () => onChanged(position),
                    leading: switch ((e, selected)) {
                      (BottonNavItems.home, true) =>
                        Assets.vectors.homeSelected.svg(),
                      (BottonNavItems.home, false) => Assets.vectors.home.svg(),
                      (BottonNavItems.library, true) =>
                        Assets.vectors.librarySelected.svg(),
                      (BottonNavItems.library, false) =>
                        Assets.vectors.library.svg(),
                      (BottonNavItems.chat, true) =>
                        Assets.vectors.aiChatSelected.svg(),
                      (BottonNavItems.chat, false) =>
                        Assets.vectors.aiChat.svg(),
                      (BottonNavItems.settings, true) =>
                        Assets.vectors.settingSelected.svg(),
                      (BottonNavItems.settings, false) =>
                        Assets.vectors.setting.svg(),
                    },
                    title: Text(switch (e) {
                      BottonNavItems.home => 'Home',
                      BottonNavItems.library => 'Library',
                      BottonNavItems.chat => 'AI Chat',
                      BottonNavItems.settings => 'Settings',
                    }),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.index,
    required this.onChanged,
  });

  final int index;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDark;
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onChanged,
      backgroundColor: isDark ? PakeColors.bnbBg : PakeColors.bgLight,
      selectedLabelStyle: 14.regular.primaryLight500,
      unselectedLabelStyle: 14.regular.neutralLight300,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      iconSize: 24.spMin,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      useLegacyColorScheme: false,
      items: [
        ...BottonNavItems.values.map(
          (e) => BottomNavigationBarItem(
            tooltip: e.name.capitalize,
            backgroundColor: isDark ? PakeColors.bnbBg : PakeColors.bgLight,
            label: switch (e) {
              BottonNavItems.home => 'Home',
              BottonNavItems.library => 'Library',
              BottonNavItems.chat => 'AI Chat',
              BottonNavItems.settings => 'Settings',
            },
            icon: switch (e) {
              BottonNavItems.home => Assets.vectors.home.svg(),
              BottonNavItems.library => Assets.vectors.library.svg(),
              BottonNavItems.chat => Assets.vectors.aiChat.svg(),
              BottonNavItems.settings => Assets.vectors.setting.svg(),
            },
            activeIcon: switch (e) {
              BottonNavItems.home => Assets.vectors.homeSelected.svg(),
              BottonNavItems.library => Assets.vectors.librarySelected.svg(),
              BottonNavItems.chat => Assets.vectors.aiChatSelected.svg(),
              BottonNavItems.settings => Assets.vectors.settingSelected.svg(),
            },
          ),
        ),
      ],
    );
  }
}
