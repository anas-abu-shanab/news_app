import 'package:hive/hive.dart';


part '../../hive/adapters/news_model.g.dart';

@HiveType(typeId: 1)
class NewsModel {

  @HiveField(0)
  int? totalArticles;

  @HiveField(1)
  List<Article>? articles;

  NewsModel({this.totalArticles, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalArticles'] = totalArticles;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Article {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? content;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? image;

  @HiveField(5)
  DateTime? publishedAt;

  @HiveField(6)
  Source? source;

  Article(
      {this.title,
        this.description,
        this.content,
        this.url,
        this.image,
        this.publishedAt,
        this.source});

  Article.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    content = json['content'];
    url = json['url'];
    image = json['image'];
    publishedAt = json["receivedAt"] == null ? null : DateTime.parse(json["receivedAt"]).toLocal();
    source =
    json['source'] != null ? Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['content'] = content;
    data['url'] = url;
    data['image'] = image;
    data['publishedAt'] = publishedAt;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Article && runtimeType == other.runtimeType && url == other.url;

  @override
  int get hashCode => url.hashCode;
}

@HiveType(typeId: 3)
class Source {

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  Source({this.name, this.url});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}