import 'package:dio/dio.dart';
import 'package:daily_quotes/models/quote.dart'; // Pastikan model Quote diimpor

class QuotesService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://zenquotes.io/api/',
  ));

  // Method untuk mendapatkan quote random dari ZenQuotes API
  Future<Quote?> getRandomQuote() async {
    try {
      // Melakukan request ke endpoint /random
      final response = await _dio.get('/random');

      // Cetak respons untuk debugging
      print('Response data: ${response.data}');

      // Pastikan respons adalah list dan ambil elemen pertama
      if (response.statusCode == 200 && response.data is List && response.data.isNotEmpty) {
        // Ambil elemen pertama dari list dan parsing ke model Quote
        return Quote.fromJson(response.data[0]);
      } else {
        print('Unexpected response format: ${response.data}');
        return null;
      }
    } catch (e) {
      print('Error fetching quote: $e');
      return null;
    }
  }
}
