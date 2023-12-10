import 'package:bro_grow_app/utils/constants/app_colors.dart';
import 'package:bro_grow_app/utils/constants/app_typography.dart';
import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompetitorCard extends StatefulWidget {
  const CompetitorCard({super.key});

  @override
  State<CompetitorCard> createState() => _CompetitorCardState();
}

class _CompetitorCardState extends State<CompetitorCard> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(
      builder: (context, homeProv, child) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.competitorCard,
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
                "Competitors",
                style: AppTypography.f24w700,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 550,
                child: SfCartesianChart(
                  enableAxisAnimation: true,
                  tooltipBehavior: _tooltipBehavior,
                  primaryXAxis: CategoryAxis(
                    labelRotation: 90,
                    name: "Competitors",
                    isVisible: false,
                    title: AxisTitle(text: "Competitors"),
                  ),
                  axes: <ChartAxis>[
                    NumericAxis(
                      isVisible: false,
                      opposedPosition: true,
                      title: AxisTitle(),
                    ),
                  ],
                  series: <ChartSeries>[
                    ColumnSeries<BarChartData, String>(
                      enableTooltip: true,
                      name: 'Competitor',
                      dataSource: homeProv.barChartData,
                      xValueMapper: (BarChartData data, _) => data.category,
                      yValueMapper: (BarChartData data, _) => data.value,
                      pointColorMapper: (BarChartData data, _) => data.color,
                    ),
                  ],
                ),
              ),
              const Text(
                "Competitors",
                style: AppTypography.f16w400,
              ),
              const SizedBox(height: 30),
              ...List.generate(homeProv.barChartData.length, (index) {
                return Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: homeProv.barChartData[index].color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      homeProv.barChartData[index].category,
                      style: AppTypography.f18w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              })
            ],
          ),
        );
      },
    );
  }
}

class BarChartData {
  final String category;
  final double value;
  final Color color;

  BarChartData(this.category, this.value, this.color);
}
