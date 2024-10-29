import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../explore/presentation/views/home.dart';

enum Currency {
  btc(
    'BTC',
    'Bitcoin',
    Icon(
      IconsaxBold.bitcoin_refresh,
      size: 40,
    ),
  ),
  eth(
    'ETH',
    'Ethereum',
    Icon(
      IconsaxBold.bitcoin_refresh,
      size: 40,
    ),
  ),
  tz(
    'XTZ',
    'Tezos',
    Icon(
      IconsaxBold.bitcoin_refresh,
      size: 40,
    ),
  );

  final String shortName;
  final String longName;
  final Widget image;

  const Currency(this.shortName, this.longName, this.image);

  static Currency fromString(String name) {
    return Currency.values.firstWhere(
      (currency) =>
          currency.shortName.toLowerCase() == name.toLowerCase() ||
          currency.longName.toLowerCase() == name.toLowerCase(),
      orElse: () => Currency.btc,
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  static const routeName = '/home';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  ValueNotifier<int> currentPage = ValueNotifier(0);
  late TabController tabController;

  static final _pages = [
    const ExploreView(),
    const PortfolioView(),
    const EarningsView(),
    const SpendView(),
    const ConnectView(),
  ];

  void onPageChanged(int page) {
    currentPage.value = page;
    tabController.index = page;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _pages.length, vsync: this)
      ..index = currentPage.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: _pages,
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentPage,
          builder: (_, page, __) {
            return BottomNavigationBar(
              selectedItemColor: Colors.black,
              onTap: onPageChanged,
              currentIndex: page,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.compass()),
                  activeIcon:
                      Icon(PhosphorIcons.compass(PhosphorIconsStyle.fill)),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.wallet()),
                  activeIcon:
                      Icon(PhosphorIcons.wallet(PhosphorIconsStyle.fill)),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.percent()),
                  activeIcon:
                      Icon(PhosphorIcons.percent(PhosphorIconsStyle.fill)),
                  label: 'Earn',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.receipt()),
                  activeIcon:
                      Icon(PhosphorIcons.receipt(PhosphorIconsStyle.fill)),
                  label: 'Spend',
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.intersectThree()),
                  activeIcon: Icon(
                      PhosphorIcons.intersectThree(PhosphorIconsStyle.fill)),
                  label: 'Connect',
                ),
              ],
            );
          }),
    );
  }
}

class ConnectView extends StatelessWidget {
  const ConnectView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Connect',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class SpendView extends StatelessWidget {
  const SpendView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Spend',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class EarningsView extends StatelessWidget {
  const EarningsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Earn',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class PortfolioView extends StatelessWidget {
  const PortfolioView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Portfoilo',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
