import 'dart:convert';

TrendingGifs trendingProductFromJson(String str) =>
    TrendingGifs.fromJson(json.decode(str));

String trendingProductToJson(TrendingGifs data) =>
    json.encode(data.toJson());

class TrendingGifs {
  List<Gifs> data;
  Meta meta;
  Pagination pagination;

  TrendingGifs({
    required this.data,
    required this.meta,
    required this.pagination,
  });

  factory TrendingGifs.fromJson(Map<String, dynamic> json) =>
      TrendingGifs(
        data: List<Gifs>.from(json["data"].map((x) => Gifs.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
        "pagination": pagination.toJson(),
      };
}

class Gifs {
  String title;

  Images images;

  Gifs({
    required this.title,
    required this.images,
  });

  factory Gifs.fromJson(Map<String, dynamic> json) => Gifs(
        title: json["title"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "images": images.toJson(),
      };
}

class Images {
  FixedHeight original;
  FixedHeight fixedHeight;
  FixedHeight fixedHeightDownsampled;
  FixedHeight fixedHeightSmall;
  FixedHeight fixedWidth;
  FixedHeight fixedWidthDownsampled;
  FixedHeight fixedWidthSmall;

  Images({
    required this.original,
    required this.fixedHeight,
    required this.fixedHeightDownsampled,
    required this.fixedHeightSmall,
    required this.fixedWidth,
    required this.fixedWidthDownsampled,
    required this.fixedWidthSmall,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: FixedHeight.fromJson(json["original"]),
        fixedHeight: FixedHeight.fromJson(json["fixed_height"]),
        fixedHeightDownsampled:
            FixedHeight.fromJson(json["fixed_height_downsampled"]),
        fixedHeightSmall: FixedHeight.fromJson(json["fixed_height_small"]),
        fixedWidth: FixedHeight.fromJson(json["fixed_width"]),
        fixedWidthDownsampled:
            FixedHeight.fromJson(json["fixed_width_downsampled"]),
        fixedWidthSmall: FixedHeight.fromJson(json["fixed_width_small"]),
      );

  Map<String, dynamic> toJson() => {
        "original": original.toJson(),
        "fixed_height": fixedHeight.toJson(),
        "fixed_height_downsampled": fixedHeightDownsampled.toJson(),
        "fixed_height_small": fixedHeightSmall.toJson(),
        "fixed_width": fixedWidth.toJson(),
        "fixed_width_downsampled": fixedWidthDownsampled.toJson(),
        "fixed_width_small": fixedWidthSmall.toJson(),
      };
}

class FixedHeight {
  String height;
  String width;
  String size;
  String url;
  String? mp4Size;
  String? mp4;
  String webpSize;
  String webp;
  String? frames;
  String? hash;

  FixedHeight({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    this.mp4Size,
    this.mp4,
    required this.webpSize,
    required this.webp,
    this.frames,
    this.hash,
  });

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
        "mp4_size": mp4Size,
        "mp4": mp4,
        "webp_size": webpSize,
        "webp": webp,
        "frames": frames,
        "hash": hash,
      };
}

class Meta {
  int status;
  String msg;
  String responseId;

  Meta({
    required this.status,
    required this.msg,
    required this.responseId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json["status"],
        msg: json["msg"],
        responseId: json["response_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "response_id": responseId,
      };
}

class Pagination {
  int totalCount;
  int count;
  int offset;

  Pagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json["total_count"],
        count: json["count"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "count": count,
        "offset": offset,
      };
}
