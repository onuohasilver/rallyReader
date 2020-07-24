import 'package:flutter/material.dart';
import 'package:rallyreader/components/text/pageTitles.dart';

class MessageBoard extends StatelessWidget {
  const MessageBoard({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (context, controller) {
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
                      color: Colors.brown[900],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: PageTitle(
                      heightT: height * .7,
                      title: ' Message Board ',
                      color: Colors.orange[50]),
                ),
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    controller: controller,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(
                        'Dish $index',
                        style: TextStyle(color: Colors.black54),
                      ));
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex:3,
                          child: TextField(
                            decoration:
                                InputDecoration(),
                          ),
                        ),
                        Spacer(),
                        Material(
                          type: MaterialType.circle,
                          color: Colors.transparent,
                          child: IconButton(
                            
                            icon: Icon(Icons.send),
                            onPressed: () {},
                            tooltip: 'Send',
                            splashColor: Colors.black,
                          ),
                        )
                      ],
                    ),
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
