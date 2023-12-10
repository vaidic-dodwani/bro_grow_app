import 'package:bro_grow_app/utils/routes/routes.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/competitor_card.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/opportunity_card.dart';
import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:bro_grow_app/view_model/pincode_details_view_model/pincode_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../data/remote/network/network_services.dart';
import '../../../utils/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomepageProvider>(context, listen: false)
          .getBuissnessData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Consumer<HomepageProvider>(
            builder: (context, homeProv, child) {
              if (homeProv.apiResponse.status == ApiStatus.initial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (homeProv.apiResponse.status == ApiStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (homeProv.apiResponse.status == ApiStatus.error) {
                return const Center(child: Text("Something went wrong"));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "BroGrow",
                      style: AppTypography.f32w700,
                      textAlign: TextAlign.center,
                    ),
                    Consumer<PincodeProvider>(
                      builder: (context, pinProv, child) => GestureDetector(
                        onTap: () async {
                          final pin = pinProv.pincode;
                          final city = pinProv.city;
                          final state = pinProv.state;
                          await context.pushNamed(AppRouteNames.pincodeRoute,
                              extra: {"ifPop": true});
                          if (pinProv.pincode != pin ||
                              pinProv.city != city ||
                              pinProv.state != state) {
                            homeProv.getBuissnessData(context);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.primaryColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      pinProv.city,
                                      textAlign: TextAlign.center,
                                      style: AppTypography.f20w400,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.arrow_drop_down_sharp)
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.category,
                                      color: AppColors.primaryColor),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      pinProv.category,
                                      style: AppTypography.f20w400,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.arrow_drop_down_sharp)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const OpportunityCard(),
                    const SizedBox(height: 40),
                    const CompetitorCard()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
