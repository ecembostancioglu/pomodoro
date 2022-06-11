import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class DropdownWidget extends StatefulWidget {
     DropdownWidget({Key? key,
      required this.name,
      required this.hint,
      required this.value,
      required this.item}) : super(key: key);

    String? name;
    String? hint;
    String? value;
    List<String>? item;

   @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.name!,
            style: Theme.of(context).textTheme.headline6),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              buttonWidth: 180,
              autofocus: true,
              hint: Text(widget.hint!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: ColorConstants.grey,
                    fontSize: 16
                ),),
              value:widget.value,
              onChanged: (val){
                setState(() {
                  widget.value = val as String;
                });
              },
              items: widget.item!.map((e) => DropdownMenuItem(
                  alignment: Alignment.center,
                  value: e,
                  child: Text(e,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorConstants.black,
                          fontSize: 22
                      )))).toList(),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: ColorConstants.highlightColor,
              ),
              buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 180,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorConstants.highlightColor,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
            ),
          ),
        ),
      ],
    );
  }
}
