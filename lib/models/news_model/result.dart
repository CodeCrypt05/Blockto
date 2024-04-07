class Result {
  String? articleId;
  String? title;
  String? link;
  // List<String>? keywords;
  List<String>? creator;
  dynamic videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  List<String>? country;
  List<String>? category;
  String? aiTag;
  String? sentiment;
  String? sentimentStats;
  String? aiRegion;

  Result({
    this.articleId,
    this.title,
    this.link,
    // this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        articleId: json['article_id'] as String?,
        title: json['title'] as String?,
        link: json['link'] as String?,
        // keywords: json['keywords'] as List<String>?,
        // creator: json['creator'] as List<String>?,
        videoUrl: json['video_url'] as dynamic,
        description: json['description'] as String?,
        content: json['content'] as String?,
        pubDate: json['pubDate'] as String?,
        imageUrl: json['image_url'] as String?,
        sourceId: json['source_id'] as String?,
        sourcePriority: json['source_priority'] as int?,
        sourceUrl: json['source_url'] as String?,
        sourceIcon: json['source_icon'] as String?,
        language: json['language'] as String?,
        // country: json['country'] as List<String>?,
        // category: json['category'] as List<String>?,
        aiTag: json['ai_tag'] as String?,
        sentiment: json['sentiment'] as String?,
        sentimentStats: json['sentiment_stats'] as String?,
        aiRegion: json['ai_region'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'article_id': articleId,
        'title': title,
        'link': link,
        // 'keywords': keywords,
        'creator': creator,
        'video_url': videoUrl,
        'description': description,
        'content': content,
        'pubDate': pubDate,
        'image_url': imageUrl,
        'source_id': sourceId,
        'source_priority': sourcePriority,
        'source_url': sourceUrl,
        'source_icon': sourceIcon,
        'language': language,
        'country': country,
        'category': category,
        'ai_tag': aiTag,
        'sentiment': sentiment,
        'sentiment_stats': sentimentStats,
        'ai_region': aiRegion,
      };
}
