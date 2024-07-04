class Crypto {
  final String name;
  final String priceUsd;
  final int rank;
  final String percentChange24h;
  final String marketCapUsd;
  final String volume24;

  Crypto({
    required this.name,
    required this.priceUsd,
    required this.rank,
    required this.percentChange24h,
    required this.marketCapUsd,
    required this.volume24,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      priceUsd: json['price_usd'],
      rank: json['rank'],
      percentChange24h: json['percent_change_24h'],
      marketCapUsd: json['market_cap_usd'],
      volume24: json['volume24'].toString(),
    );
  }

  String get priceInRupiah {
    final priceInUsd = double.tryParse(priceUsd) ?? 0;
    final priceInRupiah = priceInUsd * 15000;
    return priceInRupiah.round().toString();
  }
}
