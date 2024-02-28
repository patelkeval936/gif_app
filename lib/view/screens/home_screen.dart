
import 'package:flutter/material.dart';
import 'package:gif_app/providers/theme_provider.dart';
import 'package:gif_app/utils/app_strings.dart';
import 'package:gif_app/view/widgets/custom_search_box.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          Selector<ThemeProvider,bool>(
            builder: (BuildContext context, bool value, Widget? child) {
              return IconButton(onPressed: () {
                context.read<ThemeProvider>().toggleMode();
              }, icon: const Icon(Icons.dark_mode_outlined));
            }, selector: (ctx , themeProvider ) {
              return themeProvider.isDarkMode;
          },

          )
        ],
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: CustomSearchBox(),
          ),
          // CachedNetworkImage(
          //   imageUrl: "https://media1.giphy.com/media/ws9lSjJfBc74z1P5Rm/100.webp?cid=0b4b7039mn4w5n79y3hydgydrvqzqoxwmgdl1klpcgqfa45g&ep=v1_gifs_trending&rid=100.webp&ct=g",
          //   imageBuilder: (context, imageProvider) => Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   placeholder: (context, url) => CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
        ],
      ),
    );
  }
}
