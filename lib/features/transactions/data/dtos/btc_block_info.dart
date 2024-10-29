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

  const BtcBlockInfo.empty()
      : hash = '',
        time = 0,
        blockIndex = 0,
        height = 0,
        txIndexes = const [];

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

  const BitcoinBlockInfo.empty()
      : hash = '',
        ver = 0,
        prevBlock = '',
        mrklRoot = '',
        time = 0,
        bits = 0,
        nextBlock = const [],
        fee = 0,
        nonce = 0,
        nTx = 0,
        size = 0,
        blockIndex = 0,
        mainChain = false,
        height = 0,
        weight = 0,
        tx = const [];

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
  final List<Input> inputs;
  final List<Out> out;

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
    required this.inputs,
    required this.out,
  });

  const BitcoinTransaction.empty()
      : hash = '',
        ver = 0,
        vinSz = 0,
        voutSz = 0,
        size = 0,
        weight = 0,
        fee = 0,
        relayedBy = '',
        lockTime = 0,
        txIndex = 0,
        doubleSpend = false,
        time = 0,
        blockIndex = 0,
        blockHeight = 0,
        inputs = const [],
        out = const [];

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
      inputs: switch (json['inputs']) {
        List list => list.map((e) => Input.fromJson(e)).toList(),
        _ => const [],
      },
      out: switch (json['out']) {
        List list => list.map((e) => Out.fromJson(e)).toList(),
        _ => const [],
      },
    );
  }
}

final class Input {
  final int sequence;
  final String witness;
  final String script;
  final int index;
  final Out prevOut;

  const Input({
    required this.sequence,
    required this.witness,
    required this.script,
    required this.index,
    required this.prevOut,
  });

  const Input.empty()
      : sequence = 0,
        witness = '',
        script = '',
        index = 0,
        prevOut = const Out.empty();

  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      sequence: json['sequence'] ?? 0,
      witness: json['witness'] ?? '',
      script: json['script'] ?? '',
      index: json['index'] ?? 0,
      prevOut: Out.fromJson(json['prev_out'] ?? {}),
    );
  }
}

final class Out {
  final int type;
  final bool spent;
  final int value;
  final List<SpendingOutpoints> spendingOutpoints;
  final int n;
  final int txIndex;
  final String script;
  final String addr;

  const Out({
    required this.type,
    required this.spent,
    required this.value,
    required this.spendingOutpoints,
    required this.n,
    required this.txIndex,
    required this.script,
    required this.addr,
  });

  const Out.empty()
      : type = 0,
        spent = false,
        value = 0,
        spendingOutpoints = const [],
        n = 0,
        txIndex = 0,
        script = '',
        addr = '';

  factory Out.fromJson(Map<String, dynamic> json) {
    return Out(
      type: json['type'] ?? 0,
      spent: json['spent'] ?? false,
      value: json['value'] ?? 0,
      spendingOutpoints: switch (json['spending_outpoints']) {
        List list => list.map((e) => SpendingOutpoints.fromJson(e)).toList(),
        _ => const [],
      },
      n: json['n'] ?? 0,
      txIndex: json['tx_index'] ?? 0,
      script: json['script'] ?? '',
      addr: json['addr'] ?? '',
    );
  }
}

final class SpendingOutpoints {
  final int txIndex;
  final int n;

  const SpendingOutpoints({required this.txIndex, required this.n});

  const SpendingOutpoints.empty()
      : txIndex = 0,
        n = 0;

  factory SpendingOutpoints.fromJson(Map<String, dynamic> json) {
    return SpendingOutpoints(
      txIndex: json['tx_index'] ?? 0,
      n: json['n'] ?? 0,
    );
  }
}
