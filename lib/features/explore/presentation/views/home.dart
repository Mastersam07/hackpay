import 'package:flutter/material.dart';
import 'package:hackpay/features/explore/presentation/widgets/news_card.dart';
import 'package:hackpay/shared/assets.dart';

import '../../../../shared/mixins.dart';
import '../../../../shared/svg_icon.dart';
import '../../../dashboard/presentation/views/dashboard.dart';
import '../widgets/balance_info_card.dart';
import '../widgets/widgets.dart';

class ExploreView extends StatelessWidget with MoneyFormat {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const SvgIcon(ImageAssets.scan),
        ),
        title: const Text('Explore'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const SvgIcon(ImageAssets.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              child: SvgIcon(ImageAssets.bellOutlined),
            ),
          ),
        ],
      ),
      body: ListView(
        key: const Key('explore_list_view'),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const HomeSection(
            child: BalanceInfoCard(
              balance: 9000.22,
            ),
          ),
          HomeSection(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My assets',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(onTap: () {}, child: const Text('See all'))
                  ],
                ),
                const SizedBox(height: 16),
                const AssetCard(
                  currency: Currency.btc,
                  amount: 24000,
                  movement: MarketMovement.up(percentage: 1.76),
                ),
                const SizedBox(height: 16),
                const AssetCard(
                  currency: Currency.eth,
                  amount: 4500,
                  movement: MarketMovement.down(percentage: 1.76),
                ),
                const SizedBox(height: 16),
                const AssetCard(
                  currency: Currency.tz,
                  amount: 4500,
                  movement: MarketMovement.up(percentage: 1.76),
                ),
              ],
            ),
          ),
          HomeSection(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today\'s Top Movers',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(onTap: () {}, child: const Text('See all'))
                  ],
                ),
                const SizedBox(height: 16),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      MoverCard(
                        currency: Currency.eth,
                        movement: MarketMovement.down(percentage: 1.76),
                      ),
                      SizedBox(width: 8),
                      MoverCard(
                        currency: Currency.btc,
                        movement: MarketMovement.up(percentage: 1.76),
                      ),
                      SizedBox(width: 8),
                      MoverCard(
                        currency: Currency.sol,
                        movement: MarketMovement.up(percentage: 1.76),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          HomeSection(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending news',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(onTap: () {}, child: const Text('View more'))
                  ],
                ),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return NewsCard.expanded(
                        imageUrl: ImageAssets.newsImage,
                        headline:
                            'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                        publication: 'CoinDesk',
                        publishedAt:
                            DateTime.now().subtract(const Duration(hours: 2)),
                      );
                    }
                    return NewsCard.collapsed(
                      imageUrl: ImageAssets.newsImage,
                      headline:
                          'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                      publication: 'CoinDesk',
                      publishedAt:
                          DateTime.now().subtract(const Duration(hours: 2)),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(height: 8),
                  itemCount: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
