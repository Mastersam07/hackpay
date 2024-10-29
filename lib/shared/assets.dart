import 'package:flutter_svg_plus/flutter_svg.dart';

class ImageAssets {
  static const _baseUri = 'assets/svgs/';

  static const arrowLeft = '${_baseUri}arrow_left.svg';
  static const bellOutlined = '${_baseUri}bell_outlined.svg';
  static const bitcoinCoin = '${_baseUri}bitcoin_coin.svg';
  static const ethereumCoin = '${_baseUri}ethereum_coin.svg';
  static const exploreFilled = '${_baseUri}explore_filled.svg';
  static const externalLink = '${_baseUri}external_link.svg';
  static const peerChain = '${_baseUri}peer_chain.svg';
  static const percentOutline = '${_baseUri}percent_outline.svg';
  static const polygonCoin = '${_baseUri}polygon_coin.svg';
  static const scan = '${_baseUri}scan.svg';
  static const search = '${_baseUri}search.svg';
  static const solanaCoin = '${_baseUri}solana_coin.svg';
  static const spendOutlined = '${_baseUri}spend_outlined.svg';
  static const walletOutlined = '${_baseUri}wallet_outlined.svg';
  static const tezosCoin = '${_baseUri}tezos_coin.svg';
  static const newsImage = '${_baseUri}news_image.svg';

  static Future<void> preloadSvgs() async {
    const assetPaths = [
      arrowLeft,
      bellOutlined,
      bitcoinCoin,
      ethereumCoin,
      exploreFilled,
      externalLink,
      peerChain,
      percentOutline,
      polygonCoin,
      scan,
      search,
      solanaCoin,
      spendOutlined,
      walletOutlined,
      tezosCoin,
      newsImage,
    ];
    final svgFutures = <Future>[];
    for (final path in assetPaths) {
      final loader = SvgAssetLoader(path);
      svgFutures.add(svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null)));
    }
    await Future.wait(svgFutures);
  }
}
