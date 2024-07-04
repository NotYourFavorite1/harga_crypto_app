import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:harga_crypto_app/providers/kripto_provider.dart';
import 'package:harga_crypto_app/widgets/kripto_list_item.dart';
import 'package:harga_crypto_app/widgets/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CryptoProvider()..fetchCryptoPrices(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const CryptoPricesScreen(),
      ),
    );
  }
}

class CryptoPricesScreen extends StatelessWidget {
  const CryptoPricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptoProvider = Provider.of<CryptoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Harga Kripto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CryptoSearchDelegate(cryptoProvider.cryptos),
              );
            },
          ),
        ],
      ),
      body: cryptoProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cryptoProvider.cryptos.length,
              itemBuilder: (context, index) {
                final crypto = cryptoProvider.cryptos[index];
                return CryptoListItem(crypto: crypto);
              },
            ),
    );
  }
}
