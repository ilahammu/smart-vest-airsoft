import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownPersonel extends StatelessWidget {
  final Rx<Map<String, dynamic>?> selectedValue;
  final Function(Map<String, dynamic>?) onChanged;
  final List<Map<String, dynamic>> items;
  final String hintText;

  const CustomDropdownPersonel({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 248, 4, 4)),
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(6),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 8, 19, 236),
            Color.fromARGB(255, 255, 0, 0),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 8, 92, 219),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(4, 1),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        margin: const EdgeInsets.all(0.5),
        child: DropdownButtonHideUnderline(
          child: Obx(() => DropdownButton<Map<String, dynamic>>(
                value: selectedValue.value,
                dropdownColor: Color.fromARGB(255, 21, 218, 175),
                borderRadius: BorderRadius.circular(10),
                isDense: true,
                icon: const Icon(Icons.arrow_drop_down),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                onChanged: onChanged,
                items: items
                    .map(
                      (item) => DropdownMenuItem<Map<String, dynamic>>(
                        value: item,
                        child: Text(
                          item['name'],
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                hint: Text(
                  hintText,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
