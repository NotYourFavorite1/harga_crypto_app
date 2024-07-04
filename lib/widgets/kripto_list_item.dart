import 'package:flutter/material.dart';
import 'package:harga_crypto_app/models/kripto_model.dart';
import 'package:harga_crypto_app/widgets/kripto_detail_modal.dart';

class CryptoListItem extends StatelessWidget {
  final Crypto crypto;

  const CryptoListItem({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => CryptoDetailModal(crypto: crypto),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(crypto.name[0]),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crypto.name,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'USD: ${crypto.priceUsd}',
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'IDR: ${crypto.priceInRupiah}',
                      style: const TextStyle(color: Colors.green, fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '#${crypto.rank}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
