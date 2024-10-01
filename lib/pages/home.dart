import 'package:daily_quotes/controller/quotes_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  final QuotesController _quotesController = Get.put(QuotesController()); // Inisialisasi controller

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Quotes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tampilkan teks quote menggunakan GetX reactive state
              Obx(() => Text(
                    _quotesController.quoteText.value,
                    style: const TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 10),
              Obx(() => Text(
                    _quotesController.quoteAuthor.value,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 20),
              // Tampilkan tombol dan kontrol loading state dengan GetX
              SizedBox(
                child: Obx(() => _quotesController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _quotesController.fetchRandomQuote,
                        child: const Text('Get Random Quote'),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}