import 'package:flutter/material.dart';
import 'package:harga_crypto_app/models/kripto_model.dart';

class CryptoDetailModal extends StatelessWidget {
  final Crypto crypto;

  const CryptoDetailModal({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: Text(
                    crypto.name[0],
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  crypto.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Rank: ${crypto.rank}',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            'Price USD: ${crypto.priceUsd}',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            'Price IDR: ${crypto.priceInRupiah}',
            style: const TextStyle(color: Colors.green, fontSize: 16),
          ),
          Text(
            'Percent Change 24h: ${crypto.percentChange24h}%',
            style: TextStyle(
              color: double.parse(crypto.percentChange24h) >= 0
                  ? Colors.green
                  : Colors.red,
              fontSize: 16,
            ),
          ),
          Text(
            'Market Cap USD: ${crypto.marketCapUsd}',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
          Text(
            'Volume 24h: ${crypto.volume24}',
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
