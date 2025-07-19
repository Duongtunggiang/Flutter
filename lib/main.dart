import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme(
      displayLarge: GoogleFonts.pacifico(fontSize: 48, fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.openSans(fontSize: 14),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Birthday App',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: textTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ),
      ),
      home: const BirthdayScreen(),
    );
  }
}

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://media.giphy.com/media/3ohs4BSacFKI7A717y/giphy.gif',
                  width: size.width * 0.5,
                ),
                const SizedBox(height: 30),
                Text(
                  'Chúc mừng sinh nhật!',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.white, shadows: [
                    const Shadow(color: Colors.black45, blurRadius: 6),
                  ]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Mong mọi điều tốt đẹp sẽ đến với bạn trong năm nay!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('🎉 Gửi lời chúc thành công!'),
                        backgroundColor: Colors.pinkAccent,
                      ),
                    );
                  },
                  icon: const Icon(Icons.card_giftcard),
                  label: const Text("Gửi lời chúc"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    textStyle: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
