import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/text/pageTitles.dart';
import 'package:rallyreader/data/settings.dart';

class MessageBoard extends StatelessWidget {
  const MessageBoard({
    Key key,
    @required this.width,
    @required this.height,
    this.messages,
  }) : super(key: key);

  final double width;
  final List messages;
  final double height;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.05,
      minChildSize: 0.05,
      maxChildSize: 0.8,
      builder: (context, controller) {
        SettingsData settingsData = Provider.of<SettingsData>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.brown[100],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: width,
                  decoration: BoxDecoration(
                      color: settingsData.brownToGrey,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: PageTitle(
                      heightT: height * .7,
                      title: ' Message Board ',
                      color:Colors.white),
                ),
                Expanded(
                  flex: 7,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    controller: controller,
                    itemCount: messages.length,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          color: Colors.purple,
                          child: Text(
                            messages[index]['sender'],
                            style: TextStyle(color: Colors.black54),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
