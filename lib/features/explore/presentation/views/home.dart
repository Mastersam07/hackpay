import 'package:flutter/material.dart';
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
                      'Today’s Top Movers',
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
                      MoverCard(),
                      SizedBox(width: 8),
                      MoverCard(),
                      SizedBox(width: 8),
                      MoverCard(),
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
                        return InkWell(
                          child: SizedBox(
                            height: 268,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 166,
                                  width: double.infinity,
                                  child: Container(color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    DefaultTextStyle(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                      child: const Text(
                                        'CoinDesk • 2h',
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      return InkWell(
                        child: SizedBox(
                          height: 97,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 55,
                                height: 73,
                                child: Container(color: Colors.black),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    DefaultTextStyle(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                      child: const Text(
                                        'CoinDesk • 2h',
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(height: 8),
                    itemCount: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
