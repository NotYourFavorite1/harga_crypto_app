import 'package:flutter/material.dart';
import 'package:harga_crypto_app/models/kripto_model.dart';
import 'package:harga_crypto_app/widgets/kripto_list_item.dart';

class CryptoSearchDelegate extends SearchDelegate<Crypto> {
  final List<Crypto> cryptos;
  final FocusNode _focusNode = FocusNode();

  CryptoSearchDelegate(this.cryptos);

  @override
  void showResults(BuildContext context) {
    _focusNode.requestFocus();
    super.showResults(context);
  }

  @override
  void close(BuildContext context, Crypto result) {
    _focusNode.dispose();
    super.close(context, result);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(
            context,
            Crypto(
                name: '',
                priceUsd: '',
                rank: 0,
                percentChange24h: '',
                marketCapUsd: '',
                volume24: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = cryptos.where(
        (crypto) => crypto.name.toLowerCase().contains(query.toLowerCase()));

    return GestureDetector(
      onTap: () => close(
          context,
          Crypto(
              name: '',
              priceUsd: '',
              rank: 0,
              percentChange24h: '',
              marketCapUsd: '',
              volume24: '')),
      child: Container(
        color: Colors.transparent,
        child: ListView(
          children:
              results.map((crypto) => CryptoListItem(crypto: crypto)).toList(),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = cryptos.where(
        (crypto) => crypto.name.toLowerCase().contains(query.toLowerCase()));

    return GestureDetector(
      onTap: () => close(
          context,
          Crypto(
              name: '',
              priceUsd: '',
              rank: 0,
              percentChange24h: '',
              marketCapUsd: '',
              volume24: '')),
      child: Container(
        color: Colors.transparent,
        child: ListView(
          children: suggestions
              .map((crypto) => CryptoListItem(crypto: crypto))
              .toList(),
        ),
      ),
    );
  }
}
