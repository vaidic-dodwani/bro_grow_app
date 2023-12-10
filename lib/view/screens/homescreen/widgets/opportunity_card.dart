import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/constants/app_constants.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({super.key});

  final List<Map<String, dynamic>> level = const [
    {'level': 'High', 'color': AppColors.high},
    {'level': 'Moderate', 'color': AppColors.moderate},
    {'level': 'Medium', 'color': AppColors.medium},
    {'level': 'Low', 'color': AppColors.low},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(
      builder: (context, homeProv, child) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.opportunityCard,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Opportunities",
              style: AppTypography.f24w700,
              textAlign: TextAlign.left,
            ),
            SfCircularChart(
              annotations: [
                CircularChartAnnotation(
                  widget: Text(
                    homeProv.businessData!.oppurtunityRating!.rating.toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
              series: <CircularSeries>[
                DoughnutSeries<PieChartData, String>(
                    dataSource: [
                      PieChartData('Opportunity',
                          homeProv.businessData!.oppurtunityRating!.rating!),
                      if ((100 -
                              homeProv
                                  .businessData!.oppurtunityRating!.rating!) !=
                          0)
                        PieChartData(
                            'Grey',
                            100 -
                                homeProv
                                    .businessData!.oppurtunityRating!.rating!),
                    ],
                    xValueMapper: (datum, index) => datum.label,
                    yValueMapper: (datum, index) => datum.value,
                    pointColorMapper: (PieChartData data, _) {
                      if (data.label == 'Opportunity') {
                        if (data.value >= 80) {
                          return AppColors.high;
                        } else if (data.value >= 60) {
                          return AppColors.moderate;
                        } else if (data.value >= 40) {
                          return AppColors.medium;
                        } else if (data.value >= 20) {
                          return AppColors.low;
                        }
                      }
                      return Colors.grey;
                    },
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                    innerRadius: "80%"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  level.length,
                  (index) => Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: level[index]['color'],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        level[index]['level'],
                        style: AppTypography.f18w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PieChartData {
  PieChartData(this.label, this.value);

  final String label;
  final double value;
}
