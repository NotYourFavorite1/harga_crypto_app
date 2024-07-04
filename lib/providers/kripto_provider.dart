import 'package:flutter/material.dart';
import 'package:harga_crypto_app/models/kripto_model.dart';
import 'package:harga_crypto_app/services/kripto_service.dart';

class CryptoProvider with ChangeNotifier {
  List<Crypto> _cryptos = [];
  bool _loading = false;

  List<Crypto> get cryptos => _cryptos;
  bool get loading => _loading;

  Future<void> fetchCryptoPrices() async {
    _loading = true;
    notifyListeners();

    try {
      final data = await CryptoService().fetchCryptoPrices();
      _cryptos = data.map((item) => Crypto.fromJson(item)).toList();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
