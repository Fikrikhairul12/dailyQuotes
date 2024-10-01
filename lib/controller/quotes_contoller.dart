import 'package:daily_quotes/service/quoteservice.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController {
  var quoteText = ''.obs;
  var quoteAuthor = ''.obs;
  var isLoading = false.obs;

  final QuotesService _quotesService = QuotesService();

  // Method to fetch a random quote
  Future<void> fetchRandomQuote() async {
    try {
      isLoading(true); // Set loading state
      final quote = await _quotesService.getRandomQuote();

      if (quote != null) {
        quoteText.value = quote.content;
        quoteAuthor.value = quote.author;
      } else {
        quoteText.value = 'Failed to load quote';
        quoteAuthor.value = '';
      }
    } finally {
      isLoading(false); // Reset loading state
    }
  }
}
