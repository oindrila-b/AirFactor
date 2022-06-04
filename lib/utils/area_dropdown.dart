import 'package:flutter/material.dart';

class AreaDropdown extends StatelessWidget {
  final List<String> areas;
  final String area;
  final Function(String?) onChanged;

  const AreaDropdown({
    required this.areas,
    required this.area,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: area,
          items: areas
              .map((e) => DropdownMenuItem(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20.0,
                  child: Image.asset(
                    'images/${e.toLowerCase()}_icn.png',
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  e,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            value: e,
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}





