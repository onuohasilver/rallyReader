import 'package:flutter/material.dart';
import 'package:rallyreader/components/colorFlatButton.dart';

addToCollection(
  BuildContext context,
  double heightT,
  double widthT,
) {
  showDialog(
      context: context,
      builder: (context) {
        String selectedCollection = 'Scaly';
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: StatefulBuilder(
            builder: (context, setState) {
              
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
                      child: Text('Create a new book Collection'),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                            maxLength: 10,
                            maxLengthEnforced: true,
                            textAlign: TextAlign.center)),
                    Text('or add to an existing collection'),
                    //TODO: link to data of created collections
                    DropdownButton(
                      value: selectedCollection,
                      onChanged: (String value) {
                        setState(() {
                          selectedCollection = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(value: 'Scale', child: Text('cas')),
                        DropdownMenuItem(value: 'Sacale', child: Text('csas')),
                        DropdownMenuItem(value: 'Scaly', child: Text('caAxs'))
                      ],
                    ),
                    ColorFlatButton(
                        heightT: heightT / 2,
                        widthT: widthT,
                        label: 'Add to Collection',
                        color: Colors.orange)
                  ],
                ),
              );
            },
          ),
        );
      });
}
