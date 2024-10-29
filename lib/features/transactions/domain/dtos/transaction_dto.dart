final class TransactionDto {
  final String hash;
  final DateTime time;
  final Map<String, dynamic> metadata;

  const TransactionDto({
    required this.hash,
    required this.time,
    required this.metadata,
  });
}
