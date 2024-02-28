import 'package:flutter/material.dart';
import 'package:gif_app/repositories/trending_gif_repository.dart';
import 'package:provider/provider.dart';
import '../../models/trending_products.dart';
import '../../providers/theme_provider.dart';
import '../../utils/app_strings.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../widgets/custom_search_box.dart';

class TrendingGifsScreens extends StatefulWidget {
  const TrendingGifsScreens({super.key});

  @override
  State<TrendingGifsScreens> createState() => _TrendingGifsScreensState();
}

class _TrendingGifsScreensState extends State<TrendingGifsScreens> {
  int pageKey = 0;
  List<Gifs> trendingGifs = [];

  getTrendingProducts(int pageKey) async {
    try {
      TrendingGifs gifs = await TrendingGifRepository().getTrendingGifs(pageKey);

      if ((_pagingController.itemList?.length ?? 0) >
          gifs.pagination.totalCount) {
        _pagingController.appendLastPage(gifs.data);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(gifs.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  final PagingController<int, Gifs> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      getTrendingProducts(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.trendingProducts),
        actions: [
          Selector<ThemeProvider,bool>(
            builder: (BuildContext context, bool value, Widget? child) {
              return IconButton(onPressed: () {
                context.read<ThemeProvider>().toggleMode();
              }, icon: const Icon(Icons.dark_mode_outlined));
            }, selector: (BuildContext , themeProvider ) {
            return themeProvider.isDarkMode;
          },
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: CustomSearchBox(),
          ),
          Expanded(
            child: PagedListView<int, Gifs>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Gifs>(
              itemBuilder: (context, item, index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height:100,
                        width: 100,
                        child: Image.network(item.images.fixedHeightSmall.webp)),
                  )
            ),
            ),
          ),
        ],
      ),
    );
  }
}
