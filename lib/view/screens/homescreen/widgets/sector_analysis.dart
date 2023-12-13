import 'package:bro_grow_app/utils/constants/app_colors.dart';
import 'package:bro_grow_app/utils/constants/app_constants.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/sector_performance_widget.dart';
import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectorAnalysis extends StatelessWidget {
  const SectorAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(
      builder: (context, homeProv, child) => Column(
        children: [
          Expanded(
            flex: 8,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColors.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: AppTypography.f14w400,
                    unselectedLabelStyle: AppTypography.f14w500,
                    tabs: [
                      Tab(
                        text: "Best Performance",
                      ),
                      Tab(
                        text: "Worst Performance",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                          itemCount: homeProv.businessData!.sectoralAnalysis!
                              .topPerformingSectors!.length,
                          itemBuilder: (context, index) {
                            final item = homeProv.businessData!
                                .sectoralAnalysis!.topPerformingSectors![index];
                            return PerformanceWidget(
                              title: item.sectorName!,
                              value: double.parse(item.percentChange!),
                            );
                          },
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15);
                          },
                          itemCount: homeProv.businessData!.sectoralAnalysis!
                              .nonPerformingSectors!.length,
                          itemBuilder: (context, index) {
                            final item = homeProv.businessData!
                                .sectoralAnalysis!.nonPerformingSectors![index];
                            return PerformanceWidget(
                              title: item.sectorName!,
                              value: double.parse(item.percentChange!),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const Text(
                  "Top Performing Regions",
                  style: AppTypography.f18w500,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Sector Name",
                            style: AppTypography.f16w500,
                          ),
                          Spacer(),
                          Text(
                            "Percent Change",
                            style: AppTypography.f16w500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 7);
                          },
                          itemCount: homeProv.businessData!.sectoralAnalysis!
                              .topPerformingSectors!.length,
                          itemBuilder: (context, index) {
                            final item = homeProv.businessData!
                                .sectoralAnalysis!.topPerformingSectors![index];
                            return Row(
                              children: [
                                Text(
                                  item.sectorName.toString(),
                                  style: AppTypography.f16w400,
                                ),
                                const Spacer(),
                                Text(
                                  item.percentChange.toString(),
                                  style: AppTypography.f16w400,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
