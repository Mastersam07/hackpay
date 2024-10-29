final class TezosBlockInfo {
  final num cycle;
  final num level;
  final String hash;
  final String timestamp;
  final num proto;
  final num payloadRound;
  final List<TezosTransaction> transactions;
  final num reward;
  final num bonus;
  final num fees;

  const TezosBlockInfo({
    required this.cycle,
    required this.level,
    required this.hash,
    required this.timestamp,
    required this.proto,
    required this.payloadRound,
    required this.transactions,
    required this.reward,
    required this.bonus,
    required this.fees,
  });

  factory TezosBlockInfo.fromJson(Map<String, dynamic> json) {
    return TezosBlockInfo(
      cycle: json['cycle'] ?? 0,
      level: json['level'] ?? 0,
      hash: json['hash'] ?? '',
      timestamp: json['timestamp'] ?? '',
      proto: json['proto'] ?? 0,
      payloadRound: json['payloadRound'] ?? 0,
      transactions: switch (json['transactions']) {
        List list => List<TezosTransaction>.from(
            list.map((x) => TezosTransaction.fromJson(x))),
        _ => const [],
      },
      reward: json['reward'] ?? 0,
      bonus: json['bonus'] ?? 0,
      fees: json['fees'] ?? 0,
    );
  }
}

final class TezosTransaction {
  final String type;
  final num id;
  final num level;
  final String timestamp;
  final String block;
  final String hash;
  final num deposit;
  final num counter;
  final Initiator initiator;
  final Sender sender;
  final num senderCodeHash;
  final num nonce;
  final num gasLimit;
  final num gasUsed;
  final num storageLimit;
  final num storageUsed;
  final num bakerFee;
  final num storageFee;
  final num allocationFee;
  final Target target;
  final num targetCodeHash;
  final num amount;
  final Map<String, dynamic> parameter;
  final dynamic storage;
  final String status;
  final bool hasInternals;
  final num tokenTransfersCount;
  final num ticketTransfersCount;
  final num eventsCount;
  final Quote quote;

  const TezosTransaction({
    required this.type,
    required this.id,
    required this.level,
    required this.timestamp,
    required this.block,
    required this.hash,
    required this.deposit,
    required this.counter,
    required this.initiator,
    required this.sender,
    required this.senderCodeHash,
    required this.nonce,
    required this.gasLimit,
    required this.gasUsed,
    required this.storageLimit,
    required this.storageUsed,
    required this.bakerFee,
    required this.storageFee,
    required this.allocationFee,
    required this.target,
    required this.targetCodeHash,
    required this.amount,
    required this.parameter,
    required this.storage,
    required this.status,
    required this.hasInternals,
    required this.tokenTransfersCount,
    required this.ticketTransfersCount,
    required this.eventsCount,
    required this.quote,
  });

  factory TezosTransaction.fromJson(Map<String, dynamic> json) {
    return TezosTransaction(
      type: json['type'] ?? '',
      id: json['id'] ?? 0,
      level: json['level'] ?? 0,
      timestamp: json['timestamp'] ?? '',
      block: json['block'] ?? '',
      hash: json['hash'] ?? '',
      deposit: json['deposit'] ?? 0,
      counter: json['counter'] ?? 0,
      initiator: Initiator.fromJson(json['initiator'] ?? {}),
      sender: Sender.fromJson(json['sender'] ?? {}),
      senderCodeHash: json['senderCodeHash'] ?? 0,
      nonce: json['nonce'] ?? 0,
      gasLimit: json['gasLimit'] ?? 0,
      gasUsed: json['gasUsed'] ?? 0,
      storageLimit: json['storageLimit'] ?? 0,
      storageUsed: json['storageUsed'] ?? 0,
      bakerFee: json['bakerFee'] ?? 0,
      storageFee: json['storageFee'] ?? 0,
      allocationFee: json['allocation_fee'] ?? 0,
      target: Target.fromJson(json['target'] ?? {}),
      targetCodeHash: json['targetCodeHash'] ?? 0,
      amount: json['amount'] ?? 0,
      parameter: json['parameter'] ?? {},
      storage: json['storage'],
      status: json['status'] ?? '',
      hasInternals: json['hasInternals'] ?? false,
      tokenTransfersCount: json['tokenTransfersCount'] ?? 0,
      ticketTransfersCount: json['ticketTransfersCount'] ?? 0,
      eventsCount: json['eventsCount'] ?? 0,
      quote: Quote.fromJson(json['quote'] ?? {}),
    );
  }
}

final class Initiator {
  final String alias;
  final String address;

  const Initiator({
    required this.alias,
    required this.address,
  });

  factory Initiator.fromJson(Map<String, dynamic> json) {
    return Initiator(
      alias: json['alias'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

final class Sender {
  final String alias;
  final String address;

  const Sender({
    required this.alias,
    required this.address,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      alias: json['alias'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

final class Target {
  final String alias;
  final String address;

  const Target({
    required this.alias,
    required this.address,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      alias: json['alias'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

final class Quote {
  final num btc;
  final num eur;
  final num usd;
  final num cny;
  final num jpy;
  final num krw;
  final num eth;
  final num gbp;

  const Quote({
    required this.btc,
    required this.eur,
    required this.usd,
    required this.cny,
    required this.jpy,
    required this.krw,
    required this.eth,
    required this.gbp,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      btc: json['btc'] ?? 0,
      eur: json['eur'] ?? 0,
      usd: json['usd'] ?? 0,
      cny: json['cny'] ?? 0,
      jpy: json['jpy'] ?? 0,
      krw: json['krw'] ?? 0,
      eth: json['eth'] ?? 0,
      gbp: json['gbp'] ?? 0,
    );
  }
}
