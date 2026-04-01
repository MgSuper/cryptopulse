import 'package:flutter/material.dart';

class MarketTabs extends StatelessWidget {
  const MarketTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _tab("All", true),
          const SizedBox(width: 16),
          _tab("Watchlist", false),
        ],
      ),
    );
  }

  Widget _tab(String title, bool selected) {
    return Text(
      title,
      style: TextStyle(
        color: selected ? Colors.white : Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
