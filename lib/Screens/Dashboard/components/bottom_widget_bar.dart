import 'package:flutter/material.dart';
import 'package:flutter_auth_app/constants.dart';

class BottomWidgetBar extends StatefulWidget {

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomWidgetBar(this.currentTab, this.onSelectTab);

  @override
  State<BottomWidgetBar> createState() => _BottomWidgetBarState();
}

class _BottomWidgetBarState extends State<BottomWidgetBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.red),
        _buildItem(TabItem.green),
        _buildItem(TabItem.blue),
      ],
      onTap: (index) => widget.onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        color: _colorTabMatching(tabItem),
      ),
      label: tabName[tabItem],
    );
  }

  MaterialColor? _colorTabMatching(TabItem item) {
    return widget.currentTab == item ? activeTabColor[item] : Colors.grey;
  }
}

enum TabItem { red, green, blue }

const Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};