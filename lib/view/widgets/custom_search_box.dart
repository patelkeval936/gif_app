import 'package:flutter/material.dart';
import 'package:gif_app/utils/app_strings.dart';

class CustomSearchBox extends StatefulWidget {
  const CustomSearchBox({super.key});

  @override
  State<CustomSearchBox> createState() => _CustomSearchBoxState();
}

class _CustomSearchBoxState extends State<CustomSearchBox> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            onSubmitted: (value) {},
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              isDense: true,
                hintText: AppStrings.searchGIF,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black87),
                  borderRadius: BorderRadius.circular(12)
              )
            ),
          ),
        ),
        Center(
          child: IconButton(
              iconSize: 26,
              onPressed: () {

              }, icon: const Icon(Icons.search_outlined)),
        )
      ],
    );
  }
}
