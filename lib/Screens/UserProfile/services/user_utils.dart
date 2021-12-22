import 'package:flutter/material.dart';

class UserUtils {
  Widget tabSection(BuildContext context, Map<String, dynamic> tab1,
      Map<String, dynamic> tab2, Map<String, dynamic> tab3) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(text: tab1.entries.first.key),
                Tab(text: tab2.entries.first.key),
                Tab(text: tab3.entries.first.key),
              ],
            ),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Container(
                child: UserUtils().createRecord(tab1),
              ),
              Container(
                child: UserUtils().createRecord(tab2),
              ),
              Container(
                child: UserUtils().createRecord(tab3),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // create record
  Widget createRecord(Map<String, dynamic> record) {
    List<Widget> widgets = [];
    record.entries.forEach(
      (element) {
        widgets.add(
          buildMainRecord(title: element.key),
        );
        widgets.add(const SizedBox(height: 16));
        Widget widget = buildSubSubRecord(element.value);
        widgets.add(widget);
        widgets.add(const SizedBox(height: 16));
      },
    );
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 48,
          vertical: 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
      ),
    );
  }

  Widget buildSubSubRecord(Map map) {
    List<Widget> subWidgets = [];
    // subWidgets.add(buildMainRecord(title: element.key));
    if (map.isNotEmpty) {
      map.entries.forEach((element2) {
        // print(element2);
        if (element2.value is String) {
          subWidgets.add(buildSubRecord(
              titile: element2.key + " : ", value: element2.value));
        } else if (element2.value is Map) {
          subWidgets
              .add(buildSubRecord(titile: element2.key + " : ", value: ""));
          Widget widget = buildSubSubRecord(element2.value);
          subWidgets.add(widget);
        }
      });
    }
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: subWidgets,
      ),
    );
  }

  Row buildMainRecord({title}) => Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      );

  Widget buildSubRecord({titile, value}) => Row(
        children: [
          Text(
            titile,
            style: TextStyle(
                fontSize: 16, height: 1.4, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      );

  Widget buildDivider() => VerticalDivider();

  buildName({name, uniqueIdentificationNumber}) => Column(
        children: [
          Text(
            '${name}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            "${uniqueIdentificationNumber}",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget createRecordWithOverflowBox(tab) {
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(
        child: UserUtils().createRecord(tab),
      ),
    );
  }
}
