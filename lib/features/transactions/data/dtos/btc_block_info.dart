final class BtcBlockInfo {
  final String hash;
  final int time;
  final int blockIndex;
  final int height;
  final List<int> txIndexes;

  const BtcBlockInfo({
    required this.hash,
    required this.time,
    required this.blockIndex,
    required this.height,
    required this.txIndexes,
  });

  factory BtcBlockInfo.fromJson(Map<String, dynamic> json) {
    return BtcBlockInfo(
      hash: json['hash'] ?? '',
      time: json['time'] ?? 0,
      blockIndex: json['block_index'] ?? 0,
      height: json['height'] ?? 0,
      txIndexes: switch (json['txIndexes']) {
        List list => list.map((e) => e as int).toList(),
        _ => const [],
      },
    );
  }
}

final class BitcoinBlockInfo {
  final String hash;
  final int ver;
  final String prevBlock;
  final String mrklRoot;
  final int time;
  final int bits;
  final List<String> nextBlock;
  final int fee;
  final int nonce;
  final int nTx;
  final int size;
  final int blockIndex;
  final bool mainChain;
  final int height;
  final int weight;
  final List<BitcoinTransaction> tx;

  const BitcoinBlockInfo({
    required this.hash,
    required this.ver,
    required this.prevBlock,
    required this.mrklRoot,
    required this.time,
    required this.bits,
    required this.nextBlock,
    required this.fee,
    required this.nonce,
    required this.nTx,
    required this.size,
    required this.blockIndex,
    required this.mainChain,
    required this.height,
    required this.weight,
    required this.tx,
  });

  factory BitcoinBlockInfo.fromJson(Map<String, dynamic> json) {
    return BitcoinBlockInfo(
      hash: json['hash'] ?? '',
      ver: json['ver'] ?? 0,
      prevBlock: json['prev_block'] ?? '',
      mrklRoot: json['mrkl_root'] ?? '',
      time: json['time'] ?? 0,
      bits: json['bits'] ?? 0,
      nextBlock: switch (json['next_block']) {
        List list => list.map((e) => e.toString()).toList(),
        _ => const [],
      },
      fee: json['fee'] ?? 0,
      nonce: json['nonce'] ?? 0,
      nTx: json['n_tx'] ?? 0,
      size: json['size'] ?? 0,
      blockIndex: json['block_index'] ?? 0,
      mainChain: json['main_chain'] ?? false,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      tx: switch (json['tx']) {
        List list => list.map((e) => BitcoinTransaction.fromJson(e)).toList(),
        _ => const [],
      },
    );
  }
}

final class BitcoinTransaction {
  final String hash;
  final int ver;
  final int vinSz;
  final int voutSz;
  final int size;
  final int weight;
  final int fee;
  final String relayedBy;
  final int lockTime;
  final int txIndex;
  final bool doubleSpend;
  final int time;
  final int blockIndex;
  final int blockHeight;

  const BitcoinTransaction({
    required this.hash,
    required this.ver,
    required this.vinSz,
    required this.voutSz,
    required this.size,
    required this.weight,
    required this.fee,
    required this.relayedBy,
    required this.lockTime,
    required this.txIndex,
    required this.doubleSpend,
    required this.time,
    required this.blockIndex,
    required this.blockHeight,
  });

  factory BitcoinTransaction.fromJson(Map<String, dynamic> json) {
    return BitcoinTransaction(
      hash: json['hash'] ?? '',
      ver: json['ver'] ?? 0,
      vinSz: json['vin_sz'] ?? 0,
      voutSz: json['vout_sz'] ?? 0,
      size: json['size'] ?? 0,
      weight: json['weight'] ?? 0,
      fee: json['fee'] ?? 0,
      relayedBy: json['relayed_by'] ?? '',
      lockTime: json['lock_time'] ?? 0,
      txIndex: json['tx_index'] ?? 0,
      doubleSpend: json['double_spend'] ?? false,
      time: json['time'] ?? 0,
      blockIndex: json['block_index'] ?? 0,
      blockHeight: json['block_height'] ?? 0,
    );
  }
}
