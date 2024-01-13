import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  List<String> items = [
    'CPI1',
    'CPI2',
    'ING1_INFO',
    'ING2_INFO',
    'ING3_INFO',
    'TIC',
    'EEA1',
    'SE2',
    'SE3',
    'L1INFO',
    'L2INFO',
    'L3INFO',
  ];
  String selectedValue = 'CPI1';
  String s = 'CPI1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              s,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 192, 188, 188),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
