class ReviewModel {
  final List<CompetitorAnalysis>? competitorAnalysis;

  ReviewModel({
    this.competitorAnalysis,
  });

  ReviewModel copyWith({
    List<CompetitorAnalysis>? competitorAnalysis,
  }) =>
      ReviewModel(
        competitorAnalysis: competitorAnalysis ?? this.competitorAnalysis,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        competitorAnalysis: json["competitorAnalysis"] == null
            ? []
            : List<CompetitorAnalysis>.from(json["competitorAnalysis"]!
                .map((x) => CompetitorAnalysis.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "competitorAnalysis": competitorAnalysis == null
            ? []
            : List<dynamic>.from(competitorAnalysis!.map((x) => x.toJson())),
      };
}

class CompetitorAnalysis {
  final String? competitorName;
  final double? competitorRating;
  final String? placeId;
  final List<BestReview>? bestReviews;
  final List<WorstReview>? worstReviews;

  CompetitorAnalysis({
    this.competitorName,
    this.competitorRating,
    this.placeId,
    this.bestReviews,
    this.worstReviews,
  });

  CompetitorAnalysis copyWith({
    String? competitorName,
    double? competitorRating,
    String? placeId,
    List<BestReview>? bestReviews,
    List<WorstReview>? worstReviews,
  }) =>
      CompetitorAnalysis(
        competitorName: competitorName ?? this.competitorName,
        competitorRating: competitorRating ?? this.competitorRating,
        placeId: placeId ?? this.placeId,
        bestReviews: bestReviews ?? this.bestReviews,
        worstReviews: worstReviews ?? this.worstReviews,
      );

  factory CompetitorAnalysis.fromJson(Map<String, dynamic> json) =>
      CompetitorAnalysis(
        competitorName: json["competitor_name"],
        competitorRating: json["competitor_rating"]?.toDouble(),
        placeId: json["place_id"],
        bestReviews: json["best_reviews"] == null
            ? []
            : List<BestReview>.from(
                json["best_reviews"]!.map((x) => BestReview.fromJson(x))),
        worstReviews: json["worst_reviews"] == null
            ? []
            : List<WorstReview>.from(
                json["worst_reviews"]!.map((x) => WorstReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "competitor_name": competitorName,
        "competitor_rating": competitorRating,
        "place_id": placeId,
        "best_reviews": bestReviews == null
            ? []
            : List<dynamic>.from(bestReviews!.map((x) => x.toJson())),
        "worst_reviews": worstReviews == null
            ? []
            : List<dynamic>.from(worstReviews!.map((x) => x.toJson())),
      };
}

class BestReview {
  final String? link;
  final double? rating;
  final String? date;
  final List<String>? images;
  final String? source;
  final String? reviewId;
  final User? user;
  final String? snippet;
  final int? likes;
  final BestReviewResponse? response;

  BestReview({
    this.link,
    this.rating,
    this.date,
    this.images,
    this.source,
    this.reviewId,
    this.user,
    this.snippet,
    this.likes,
    this.response,
  });

  BestReview copyWith({
    String? link,
    double? rating,
    String? date,
    List<String>? images,
    String? source,
    String? reviewId,
    User? user,
    String? snippet,
    int? likes,
    BestReviewResponse? response,
  }) =>
      BestReview(
        link: link ?? this.link,
        rating: rating ?? this.rating,
        date: date ?? this.date,
        images: images ?? this.images,
        source: source ?? this.source,
        reviewId: reviewId ?? this.reviewId,
        user: user ?? this.user,
        snippet: snippet ?? this.snippet,
        likes: likes ?? this.likes,
        response: response ?? this.response,
      );

  factory BestReview.fromJson(Map<String, dynamic> json) => BestReview(
        link: json["link"],
        rating: json["rating"].toDouble(),
        date: json["date"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        source: json["source"],
        reviewId: json["review_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        snippet: json["snippet"],
        likes: json["likes"],
        response: json["response"] == null
            ? null
            : BestReviewResponse.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "rating": rating,
        "date": date,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "source": source,
        "review_id": reviewId,
        "user": user?.toJson(),
        "snippet": snippet,
        "likes": likes,
        "response": response?.toJson(),
      };
}

class BestReviewResponse {
  final String? date;
  final String? snippet;

  BestReviewResponse({
    this.date,
    this.snippet,
  });

  BestReviewResponse copyWith({
    String? date,
    String? snippet,
  }) =>
      BestReviewResponse(
        date: date ?? this.date,
        snippet: snippet ?? this.snippet,
      );

  factory BestReviewResponse.fromJson(Map<String, dynamic> json) =>
      BestReviewResponse(
        date: json["date"],
        snippet: json["snippet"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "snippet": snippet,
      };
}

class User {
  final String? name;
  final String? link;
  final String? contributorId;
  final String? thumbnail;
  final bool? localGuide;
  final int? reviews;
  final int? photos;

  User({
    this.name,
    this.link,
    this.contributorId,
    this.thumbnail,
    this.localGuide,
    this.reviews,
    this.photos,
  });

  User copyWith({
    String? name,
    String? link,
    String? contributorId,
    String? thumbnail,
    bool? localGuide,
    int? reviews,
    int? photos,
  }) =>
      User(
        name: name ?? this.name,
        link: link ?? this.link,
        contributorId: contributorId ?? this.contributorId,
        thumbnail: thumbnail ?? this.thumbnail,
        localGuide: localGuide ?? this.localGuide,
        reviews: reviews ?? this.reviews,
        photos: photos ?? this.photos,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        link: json["link"],
        contributorId: json["contributor_id"],
        thumbnail: json["thumbnail"],
        localGuide: json["local_guide"],
        reviews: json["reviews"],
        photos: json["photos"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "contributor_id": contributorId,
        "thumbnail": thumbnail,
        "local_guide": localGuide,
        "reviews": reviews,
        "photos": photos,
      };
}

class WorstReview {
  final String? link;
  final double? rating;
  final String? date;
  final String? source;
  final String? reviewId;
  final User? user;
  final String? snippet;
  final int? likes;
  final WorstReviewResponse? response;
  final ExtractedSnippet? extractedSnippet;

  WorstReview({
    this.link,
    this.rating,
    this.date,
    this.source,
    this.reviewId,
    this.user,
    this.snippet,
    this.likes,
    this.response,
    this.extractedSnippet,
  });

  WorstReview copyWith({
    String? link,
    double? rating,
    String? date,
    String? source,
    String? reviewId,
    User? user,
    String? snippet,
    int? likes,
    WorstReviewResponse? response,
    ExtractedSnippet? extractedSnippet,
  }) =>
      WorstReview(
        link: link ?? this.link,
        rating: rating ?? this.rating,
        date: date ?? this.date,
        source: source ?? this.source,
        reviewId: reviewId ?? this.reviewId,
        user: user ?? this.user,
        snippet: snippet ?? this.snippet,
        likes: likes ?? this.likes,
        response: response ?? this.response,
        extractedSnippet: extractedSnippet ?? this.extractedSnippet,
      );

  factory WorstReview.fromJson(Map<String, dynamic> json) => WorstReview(
        link: json["link"],
        rating: json["rating"].toDouble(),
        date: json["date"],
        source: json["source"],
        reviewId: json["review_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        snippet: json["snippet"],
        likes: json["likes"],
        response: json["response"] == null
            ? null
            : WorstReviewResponse.fromJson(json["response"]),
        extractedSnippet: json["extracted_snippet"] == null
            ? null
            : ExtractedSnippet.fromJson(json["extracted_snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "rating": rating,
        "date": date,
        "source": source,
        "review_id": reviewId,
        "user": user?.toJson(),
        "snippet": snippet,
        "likes": likes,
        "response": response?.toJson(),
        "extracted_snippet": extractedSnippet?.toJson(),
      };
}

class ExtractedSnippet {
  final String? original;
  final String? translated;

  ExtractedSnippet({
    this.original,
    this.translated,
  });

  ExtractedSnippet copyWith({
    String? original,
    String? translated,
  }) =>
      ExtractedSnippet(
        original: original ?? this.original,
        translated: translated ?? this.translated,
      );

  factory ExtractedSnippet.fromJson(Map<String, dynamic> json) =>
      ExtractedSnippet(
        original: json["original"],
        translated: json["translated"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "translated": translated,
      };
}

class WorstReviewResponse {
  final String? date;
  final String? snippet;
  final ExtractedSnippet? extractedSnippet;

  WorstReviewResponse({
    this.date,
    this.snippet,
    this.extractedSnippet,
  });

  WorstReviewResponse copyWith({
    String? date,
    String? snippet,
    ExtractedSnippet? extractedSnippet,
  }) =>
      WorstReviewResponse(
        date: date ?? this.date,
        snippet: snippet ?? this.snippet,
        extractedSnippet: extractedSnippet ?? this.extractedSnippet,
      );

  factory WorstReviewResponse.fromJson(Map<String, dynamic> json) =>
      WorstReviewResponse(
        date: json["date"],
        snippet: json["snippet"],
        extractedSnippet: json["extracted_snippet"] == null
            ? null
            : ExtractedSnippet.fromJson(json["extracted_snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "snippet": snippet,
        "extracted_snippet": extractedSnippet?.toJson(),
      };
}
