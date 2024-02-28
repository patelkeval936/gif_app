

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/api_utils.dart';
import '../models/trending_products.dart';

class TrendingGifRepository{
  Future<TrendingGifs> getTrendingGifs(int pageCount) async {
    final uri = Uri.parse('${APIUtils.baseUrl}/${APIUtils.trendingEndPoint}')
        .replace(queryParameters: {
      "api_key": APIUtils.gifApiKey,
      'limit': "30",
      'offset': "$pageCount",
    });

    http.Response response = await http.get(uri);

    print('response is ${response.body}');

    Map<String, dynamic> data = jsonDecode(response.body);

    print('data is $data');

    return TrendingGifs.fromJson(data);
  }
}