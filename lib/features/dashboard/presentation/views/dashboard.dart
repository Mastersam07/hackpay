import 'package:flutter/material.dart';

import '../../../../shared/assets.dart';
import '../../../../shared/svg_icon.dart';
import '../../../explore/presentation/views/home.dart';

enum Currency {
  btc(
    'BTC',
    'Bitcoin',
    SvgIcon(ImageAssets.bitcoinCoin),
  ),
  eth(
    'ETH',
    'Ethereum',
    SvgIcon(ImageAssets.ethereumCoin),
  ),
  tz(
    'XTZ',
    'Tezos',
    Image(
      fit: BoxFit.fill,
      image: AssetImage(ImageAssets.tezosCoin),
    ),
  ),
  sol(
    'SOL',
    'Solana',
    SvgIcon(ImageAssets.solanaCoin),
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
              backgroundColor: Colors.white,
              onTap: onPageChanged,
              currentIndex: page,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgIcon(
                    ImageAssets.exploreFilled,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  activeIcon: SvgIcon(
                    ImageAssets.exploreFilled,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: SvgIcon(
                    ImageAssets.walletOutlined,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  activeIcon: SvgIcon(
                    ImageAssets.walletOutlined,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: SvgIcon(
                    ImageAssets.percentOutline,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  activeIcon: SvgIcon(
                    ImageAssets.percentOutline,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  label: 'Earn',
                ),
                BottomNavigationBarItem(
                  icon: SvgIcon(
                    ImageAssets.spendOutlined,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  activeIcon: SvgIcon(
                    ImageAssets.spendOutlined,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  label: 'Spend',
                ),
                BottomNavigationBarItem(
                  icon: SvgIcon(
                    ImageAssets.peerChain,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
                  activeIcon: SvgIcon(
                    ImageAssets.peerChain,
                    height: Theme.of(context).iconTheme.size,
                    width: Theme.of(context).iconTheme.size,
                  ),
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
