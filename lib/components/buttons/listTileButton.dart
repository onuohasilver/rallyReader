import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton({
    Key key,
    @required this.label,
    @required this.icon,
    this.condition,
    this.trigger,
    @required this.width,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final bool condition;
  final Function trigger;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
            leading: Icon(Icons.scatter_plot, color: Colors.white),
            title: Text(label,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontSize: width * .031)),
            trailing: IconButton(
              icon: Icon(icon, color: condition ? Colors.green : Colors.white),
              onPressed: trigger,
            )),
      ),
    );
  }
}
