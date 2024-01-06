import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  String dropdownvalue = "All";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFC49677),
      borderRadius: BorderRadius.circular(30.0),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          hint: const Center(
            child: Text(
              "District",
              style: TextStyle(color: Colors.white),
            ),
          ),
          items: const [
            DropdownMenuItem<String>(
              value: "aveiro",
              child: Text(
                "Aveiro",
              ),
            ),
            DropdownMenuItem<String>(
              value: "beja",
              child: Text(
                "Beja",
              ),
            ),
            DropdownMenuItem<String>(
              value: "braganca",
              child: Text(
                "Bragança",
              ),
            ),
            DropdownMenuItem<String>(
              value: "castelobranco",
              child: Text(
                "Castelo\nBranco",
              ),
            ),
            DropdownMenuItem<String>(
              value: "coimbra",
              child: Text(
                "Coimbra",
              ),
            ),
            DropdownMenuItem<String>(
              value: "evora",
              child: Text(
                "Évora",
              ),
            ),
            DropdownMenuItem<String>(
              value: "faro",
              child: Text(
                "Faro",
              ),
            ),
            DropdownMenuItem<String>(
              value: "guarda ",
              child: Text(
                "Guarda",
              ),
            ),
            DropdownMenuItem<String>(
              value: "leiria",
              child: Text(
                "Leiria",
              ),
            ),
            DropdownMenuItem<String>(
              value: "lisboa",
              child: Text(
                "Lisboa",
              ),
            ),
            DropdownMenuItem<String>(
              value: "portalegre",
              child: Text(
                "Portalegre",
              ),
            ),
            DropdownMenuItem<String>(
              value: "porto",
              child: Text(
                "Porto",
              ),
            ),
            DropdownMenuItem<String>(
              value: "setubal",
              child: Text(
                "Setúbal",
              ),
            ),
            DropdownMenuItem<String>(
              value: "viana",
              child: Text(
                "Viana do\nCastelo",
              ),
            ),
            DropdownMenuItem<String>(
              value: "vilareal",
              child: Text(
                "Vila Real",
              ),
            ),
            DropdownMenuItem<String>(
              value: "viseu",
              child: Text(
                "Viseu",
              ),
            ),
          ],
          onChanged: (String? newvalue) {
            dropdownvalue = newvalue!;
          },
          underline: const SizedBox(),
          icon: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
