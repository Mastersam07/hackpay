import 'package:flutter/material.dart';
import 'package:hackpay/features/explore/presentation/widgets/news_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../shared/mixins.dart';
import '../../../dashboard/presentation/views/dashboard.dart';
import '../widgets/widgets.dart';

class ExploreView extends StatelessWidget with MoneyFormat {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(PhosphorIcons.scan()),
        ),
        title: const Text('Explore'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(PhosphorIcons.magnifyingGlass()),
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              child: Icon(PhosphorIcons.bell()),
            ),
          ),
        ],
      ),
      body: ListView(
        key: const Key('explore_list_view'),
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          HomeSection(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'My balance',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.remove_red_eye,
                        size: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    text: '₦',
                    style: Theme.of(context).textTheme.titleSmall,
                    children: [
                      TextSpan(
                        text: currencyFormat(symbol: '').format(5000),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextSpan(
                        text: decimalOnlyFormat.format(00),
                      ),
                    ],
                  ),
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
                      'My assets',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(onPressed: () {}, child: const Text('See all'))
                  ],
                ),
                const AssetCard(
                  currency: Currency.btc,
                ),
                const SizedBox(height: 16),
                const AssetCard(
                  currency: Currency.eth,
                ),
                const SizedBox(height: 16),
                const AssetCard(
                  currency: Currency.tz,
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
                    TextButton(onPressed: () {}, child: const Text('See all'))
                  ],
                ),
                const SizedBox(height: 8),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      MoverCard(currency: Currency.eth),
                      SizedBox(width: 8),
                      MoverCard(currency: Currency.btc),
                      SizedBox(width: 8),
                      MoverCard(currency: Currency.sol),
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
                    TextButton(onPressed: () {}, child: const Text('View more'))
                  ],
                ),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return NewsCard.expanded(
                        headline:
                            'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                        publication: 'CoinDesk',
                        publishedAt:
                            DateTime.now().subtract(const Duration(hours: 2)),
                      );
                    }
                    return NewsCard.collapsed(
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
