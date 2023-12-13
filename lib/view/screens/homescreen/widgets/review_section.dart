import 'package:bro_grow_app/data/remote/network/response/api_responses.dart';
import 'package:bro_grow_app/utils/constants/app_colors.dart';
import 'package:bro_grow_app/utils/constants/app_typography.dart';
import 'package:bro_grow_app/view/shared/custom_star_rating.dart';
import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:bro_grow_app/view_model/review_view_model/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection({super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReviewProvider>(context, listen: false).getReview(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(
      builder: (context, reviewProv, child) {
        if ((reviewProv.apiResponse.status == ApiStatus.initial) ||
            (reviewProv.apiResponse.status == ApiStatus.loading)) {
          return const Center(child: CircularProgressIndicator());
        } else if (reviewProv.apiResponse.status == ApiStatus.error) {
          return const Text("Something went wrong");
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Reviews",
                style: AppTypography.f24w400,
                textAlign: TextAlign.center,
              ),
              Column(
                children: List.generate(
                    reviewProv.reviewModel!.competitorAnalysis!.length,
                    (indexCompetitor) {
                  final item = reviewProv
                      .reviewModel!.competitorAnalysis![indexCompetitor];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: pallete[indexCompetitor % pallete.length],
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "  ${item.competitorName!}",
                                    style: AppTypography.f16w500.copyWith(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  "${item.competitorRating!.toStringAsFixed(2)}%  ",
                                  style: AppTypography.f20w700
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: AppColors.successColor.withOpacity(0.1),
                            child: Column(
                              children: [
                                const Text(
                                  "Best Reviews",
                                  style: AppTypography.f22w500,
                                ),
                                ...List.generate(
                                  item.bestReviews!.length,
                                  (index) {
                                    final rate = item.bestReviews![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    if (rate.link != null) {
                                                      launchUrl(
                                                          Uri.parse(rate.link!),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    }
                                                  },
                                                  child: Text(
                                                    rate.user!.name.toString(),
                                                    style: AppTypography.f16w500
                                                        .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationColor:
                                                                Colors.black),
                                                  ),
                                                ),
                                                CustomStarRating(
                                                  rating: rate.rating!,
                                                  readOnly: true,
                                                  color: pallete[
                                                      indexCompetitor %
                                                          pallete.length],
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              rate.snippet.toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            color: AppColors.errorColor.withOpacity(0.1),
                            child: Column(
                              children: [
                                const Text(
                                  "Worst Reviews",
                                  style: AppTypography.f22w500,
                                ),
                                ...List.generate(
                                  item.worstReviews!.length,
                                  (index) {
                                    final rate = item.worstReviews![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  rate.user!.name.toString(),
                                                  style: AppTypography.f16w500
                                                      .copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              Colors.black),
                                                ),
                                                CustomStarRating(
                                                  rating: rate.rating!,
                                                  readOnly: true,
                                                  color: pallete[
                                                      indexCompetitor %
                                                          pallete.length],
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              rate.snippet ?? "NO COMMENTS",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                decoration: rate.snippet == null
                                                    ? TextDecoration.underline
                                                    : null,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
