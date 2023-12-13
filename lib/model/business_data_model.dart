class BusinessData {
  final CompetitorAnalysis? competitorAnalysis;
  final OppurtunityRating? oppurtunityRating;
  final SectoralAnalysis? sectoralAnalysis;
  final EaseOfBusiness? relativeProsperity;
  final EaseOfBusiness? easeOfBusiness;

  BusinessData({
    this.competitorAnalysis,
    this.oppurtunityRating,
    this.sectoralAnalysis,
    this.relativeProsperity,
    this.easeOfBusiness,
  });

  BusinessData copyWith({
    CompetitorAnalysis? competitorAnalysis,
    OppurtunityRating? oppurtunityRating,
    SectoralAnalysis? sectoralAnalysis,
    EaseOfBusiness? relativeProsperity,
    EaseOfBusiness? easeOfBusiness,
  }) =>
      BusinessData(
        competitorAnalysis: competitorAnalysis ?? this.competitorAnalysis,
        oppurtunityRating: oppurtunityRating ?? this.oppurtunityRating,
        sectoralAnalysis: sectoralAnalysis ?? this.sectoralAnalysis,
        relativeProsperity: relativeProsperity ?? this.relativeProsperity,
        easeOfBusiness: easeOfBusiness ?? this.easeOfBusiness,
      );

  factory BusinessData.fromJson(Map<String, dynamic> json) => BusinessData(
        competitorAnalysis: json["competitorAnalysis"] == null
            ? null
            : CompetitorAnalysis.fromJson(json["competitorAnalysis"]),
        oppurtunityRating: json["oppurtunityRating"] == null
            ? null
            : OppurtunityRating.fromJson(json["oppurtunityRating"]),
        sectoralAnalysis: json["sectoralAnalysis"] == null
            ? null
            : SectoralAnalysis.fromJson(json["sectoralAnalysis"]),
        relativeProsperity: json["relativeProsperity"] == null
            ? null
            : EaseOfBusiness.fromJson(json["relativeProsperity"]),
        easeOfBusiness: json["easeOfBusiness"] == null
            ? null
            : EaseOfBusiness.fromJson(json["easeOfBusiness"]),
      );

  Map<String, dynamic> toJson() => {
        "competitorAnalysis": competitorAnalysis?.toJson(),
        "oppurtunityRating": oppurtunityRating?.toJson(),
        "sectoralAnalysis": sectoralAnalysis?.toJson(),
        "relativeProsperity": relativeProsperity?.toJson(),
        "easeOfBusiness": easeOfBusiness?.toJson(),
      };
}

class CompetitorAnalysis {
  final String? name;
  final double? rating;
  final List<Competitor>? competitors;
  final String? remarks;

  CompetitorAnalysis({
    this.name,
    this.rating,
    this.competitors,
    this.remarks,
  });

  CompetitorAnalysis copyWith({
    String? name,
    double? rating,
    List<Competitor>? competitors,
    String? remarks,
  }) =>
      CompetitorAnalysis(
        name: name ?? this.name,
        rating: rating ?? this.rating,
        competitors: competitors ?? this.competitors,
        remarks: remarks ?? this.remarks,
      );

  factory CompetitorAnalysis.fromJson(Map<String, dynamic> json) =>
      CompetitorAnalysis(
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        competitors: json["competitors"] == null
            ? []
            : List<Competitor>.from(
                json["competitors"]!.map((x) => Competitor.fromJson(x))),
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "competitors": competitors == null
            ? []
            : List<dynamic>.from(competitors!.map((x) => x.toJson())),
        "remarks": remarks,
      };
}

class Competitor {
  final String? competitorName;
  final double? competitorRating;

  Competitor({
    this.competitorName,
    this.competitorRating,
  });

  Competitor copyWith({
    String? competitorName,
    double? competitorRating,
  }) =>
      Competitor(
        competitorName: competitorName ?? this.competitorName,
        competitorRating: competitorRating ?? this.competitorRating,
      );

  factory Competitor.fromJson(Map<String, dynamic> json) => Competitor(
        competitorName: json["competitor_name"],
        competitorRating: json["competitor_rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "competitor_name": competitorName,
        "competitor_rating": competitorRating,
      };
}

class EaseOfBusiness {
  final String? name;
  final double? rating;
  final List<BetterArea>? betterAreas;
  final String? remark;
  final List<String>? moreProsperousAreas;

  EaseOfBusiness({
    this.name,
    this.rating,
    this.betterAreas,
    this.remark,
    this.moreProsperousAreas,
  });

  EaseOfBusiness copyWith({
    String? name,
    double? rating,
    List<BetterArea>? betterAreas,
    String? remark,
    List<String>? moreProsperousAreas,
  }) =>
      EaseOfBusiness(
        name: name ?? this.name,
        rating: rating ?? this.rating,
        betterAreas: betterAreas ?? this.betterAreas,
        remark: remark ?? this.remark,
        moreProsperousAreas: moreProsperousAreas ?? this.moreProsperousAreas,
      );

  factory EaseOfBusiness.fromJson(Map<String, dynamic> json) => EaseOfBusiness(
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        betterAreas: json["betterAreas"] == null
            ? []
            : List<BetterArea>.from(
                json["betterAreas"]!.map((x) => BetterArea.fromJson(x))),
        remark: json["remark"],
        moreProsperousAreas: json["moreProsperousAreas"] == null
            ? []
            : List<String>.from(json["moreProsperousAreas"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "betterAreas": betterAreas == null
            ? []
            : List<dynamic>.from(betterAreas!.map((x) => x.toJson())),
        "remark": remark,
        "moreProsperousAreas": moreProsperousAreas == null
            ? []
            : List<dynamic>.from(moreProsperousAreas!.map((x) => x)),
      };
}

class BetterArea {
  final String? stateName;
  final double? perCapita;

  BetterArea({
    this.stateName,
    this.perCapita,
  });

  BetterArea copyWith({
    String? stateName,
    double? perCapita,
  }) =>
      BetterArea(
        stateName: stateName ?? this.stateName,
        perCapita: perCapita ?? this.perCapita,
      );

  factory BetterArea.fromJson(Map<String, dynamic> json) => BetterArea(
        stateName: json["stateName"],
        perCapita: json["perCapita"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "stateName": stateName,
        "perCapita": perCapita,
      };
}

class OppurtunityRating {
  final String? name;
  final double? rating;

  OppurtunityRating({
    this.name,
    this.rating,
  });

  OppurtunityRating copyWith({
    String? name,
    double? rating,
  }) =>
      OppurtunityRating(
        name: name ?? this.name,
        rating: rating ?? this.rating,
      );

  factory OppurtunityRating.fromJson(Map<String, dynamic> json) =>
      OppurtunityRating(
        name: json["name"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
      };
}

class SectoralAnalysis {
  final String? name;
  final double? rating;
  final List<PerformingSector>? topPerformingSectors;
  final List<PerformingSector>? nonPerformingSectors;
  final String? remark;

  SectoralAnalysis({
    this.name,
    this.rating,
    this.topPerformingSectors,
    this.nonPerformingSectors,
    this.remark,
  });

  SectoralAnalysis copyWith({
    String? name,
    double? rating,
    List<PerformingSector>? topPerformingSectors,
    List<PerformingSector>? nonPerformingSectors,
    String? remark,
  }) =>
      SectoralAnalysis(
        name: name ?? this.name,
        rating: rating ?? this.rating,
        topPerformingSectors: topPerformingSectors ?? this.topPerformingSectors,
        nonPerformingSectors: nonPerformingSectors ?? this.nonPerformingSectors,
        remark: remark ?? this.remark,
      );

  factory SectoralAnalysis.fromJson(Map<String, dynamic> json) =>
      SectoralAnalysis(
        name: json["name"],
        rating: json["rating"]?.toDouble(),
        topPerformingSectors: json["top_performing_sectors"] == null
            ? []
            : List<PerformingSector>.from(json["top_performing_sectors"]!
                .map((x) => PerformingSector.fromJson(x))),
        nonPerformingSectors: json["non_performing_sectors"] == null
            ? []
            : List<PerformingSector>.from(json["non_performing_sectors"]!
                .map((x) => PerformingSector.fromJson(x))),
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "top_performing_sectors": topPerformingSectors == null
            ? []
            : List<dynamic>.from(topPerformingSectors!.map((x) => x.toJson())),
        "non_performing_sectors": nonPerformingSectors == null
            ? []
            : List<dynamic>.from(nonPerformingSectors!.map((x) => x.toJson())),
        "remark": remark,
      };
}

class PerformingSector {
  final String? sectorName;
  final String? percentChange;

  PerformingSector({
    this.sectorName,
    this.percentChange,
  });

  PerformingSector copyWith({
    String? sectorName,
    String? percentChange,
  }) =>
      PerformingSector(
        sectorName: sectorName ?? this.sectorName,
        percentChange: percentChange ?? this.percentChange,
      );

  factory PerformingSector.fromJson(Map<String, dynamic> json) =>
      PerformingSector(
        sectorName: json["sectorName"],
        percentChange: json["percentChange"],
      );

  Map<String, dynamic> toJson() => {
        "sectorName": sectorName,
        "percentChange": percentChange,
      };
}
