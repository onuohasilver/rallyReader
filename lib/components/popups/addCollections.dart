import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rallyreader/components/buttons/colorFlatButton.dart';

import 'package:rallyreader/data/data.dart';

addToCollection(
    BuildContext context, double heightT, double widthT, String bookTitle) {
  showDialog(
      context: context,
      builder: (context) {
        String selectedCollection = 'Scaly';
        final appData = Provider.of<Data>(context);
        TextEditingController textController = TextEditingController();

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                height: heightT * .3,
                width: widthT,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: heightT * .03),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Create a new book $selectedCollection'),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          maxLength: 10,
                          maxLengthEnforced: true,
                          textAlign: TextAlign.center,
                          controller: textController,
                        )),
                    Text('or add to an existing collection'),
                    //TODO: link to data of created collections
                    DropdownButton(
                      value: selectedCollection,
                      elevation: 8,
                      onChanged: (String value) {
                        setState(() {
                          selectedCollection = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(value: 'Scaxle', child: Text('cxas')),
                        DropdownMenuItem(value: 'Sacxale', child: Text('csas')),
                        DropdownMenuItem(value: 'Scaly', child: Text('caAxs')),
                        DropdownMenuItem(value: 'ffff', child: Text('fff'))
                      ],
                    ),
                    ColorFlatButton(
                        heightT: heightT / 2,
                        widthT: widthT,
                        label: 'Add to Collection',
                        onTap: () {
                          appData.createCollection(
                              (textController.text.length < 2)
                                  ? selectedCollection
                                  : textController.text,
                              bookTitle);
                          Navigator.pop(context);
                        },
                        color: Colors.orange)
                  ],
                ),
              );
            },
          ),
        );
      });
}
