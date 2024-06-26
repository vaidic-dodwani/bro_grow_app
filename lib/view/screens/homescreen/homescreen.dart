import 'package:bro_grow_app/view/screens/homescreen/widgets/account_aggregator.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/competitor_analysis.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/review_section.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/sector_analysis.dart';
import 'package:bro_grow_app/view/screens/homescreen/widgets/web_map.dart';
import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const CompetitorAnalysis(),
    const SectorAnalysis(),
    const ReviewSection(),
    const AccountAggregator(),
    const WebMap()
  ];

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
    return Consumer<HomepageProvider>(
      builder: (context, homeProv, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          currentIndex: homeProv.pageIndex,
          onTap: (value) {
            homeProv.pageIndex = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on), label: "Sector"),
            BottomNavigationBarItem(
                icon: Icon(Icons.reviews), label: "Reviews"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_rounded), label: "Map"),
          ],
        ),
        body: SafeArea(
          child: Padding(
              padding: homeProv.pageIndex == 4
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 16.0),
              child: _pages[homeProv.pageIndex]),
        ),
      ),
    );
  }
}
