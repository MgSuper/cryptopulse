import 'package:flutter/material.dart';

class MarketTableHeader extends StatelessWidget {
  const MarketTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: const [
          Expanded(
            flex: 1,
            child: Text("Icon", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 3,
            child: Text("Name", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 3,
            child: Text("Price", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 2,
            child: Text("24h %", style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 2,
            child: Text("Chart", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
