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

  const TezosBlockInfo.empty()
      : cycle = 0,
        level = 0,
        hash = '',
        timestamp = '',
        proto = 0,
        payloadRound = 0,
        transactions = const [],
        reward = 0,
        bonus = 0,
        fees = 0;

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
  final List<Diff> diffs;
  final String status;
  final List<Error> errors;
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
    required this.diffs,
    required this.status,
    required this.errors,
    required this.hasInternals,
    required this.tokenTransfersCount,
    required this.ticketTransfersCount,
    required this.eventsCount,
    required this.quote,
  });

  const TezosTransaction.empty()
      : type = '',
        id = 0,
        level = 0,
        timestamp = '',
        block = '',
        hash = '',
        deposit = 0,
        counter = 0,
        initiator = const Initiator.empty(),
        sender = const Sender.empty(),
        senderCodeHash = 0,
        nonce = 0,
        gasLimit = 0,
        gasUsed = 0,
        storageLimit = 0,
        storageUsed = 0,
        bakerFee = 0,
        storageFee = 0,
        allocationFee = 0,
        target = const Target.empty(),
        targetCodeHash = 0,
        amount = 0,
        parameter = const {},
        storage = null,
        diffs = const [],
        status = '',
        errors = const [],
        hasInternals = false,
        tokenTransfersCount = 0,
        ticketTransfersCount = 0,
        eventsCount = 0,
        quote = const Quote.empty();

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
      diffs: List<Diff>.from(
        json['diffs']?.map((x) => Diff.fromJson(x)) ?? [],
      ),
      status: json['status'] ?? '',
      errors: List<Error>.from(
        json['errors']?.map((x) => Error.fromJson(x)) ?? [],
      ),
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

  const Initiator.empty()
      : alias = '',
        address = '';

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

  const Sender.empty()
      : alias = '',
        address = '';

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

  const Target.empty()
      : alias = '',
        address = '';

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      alias: json['alias'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

final class Diff {
  final num bigmap;
  final String path;
  final String action;
  final Map<String, dynamic> content;

  const Diff({
    required this.bigmap,
    required this.path,
    required this.action,
    required this.content,
  });

  factory Diff.fromJson(Map<String, dynamic> json) {
    return Diff(
      bigmap: json['bigmap'] ?? 0,
      path: json['path'] ?? '',
      action: json['action'] ?? '',
      content: json['content'] ?? {},
    );
  }
}

final class Error {
  final String type;

  const Error({
    required this.type,
  });

  const Error.empty() : type = '';

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      type: json['type'] ?? '',
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

  const Quote.empty()
      : this(
          btc: 0,
          eur: 0,
          usd: 0,
          cny: 0,
          jpy: 0,
          krw: 0,
          eth: 0,
          gbp: 0,
        );

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
