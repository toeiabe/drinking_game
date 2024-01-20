import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String players;
  final String chosens;
  const GameScreen({super.key, required this.players, required this.chosens});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<int> generateRandomNumbers(int chosens, int players) {
    if (chosens <= 0 || players - 0 < chosens) {
      throw ArgumentError('Invalid arguments');
    }

    final random = Random();
    final Set<int> uniqueNumbers = <int>{};

    while (uniqueNumbers.length < chosens) {
      uniqueNumbers.add(random.nextInt(players));
    }

    return uniqueNumbers.toList();
  }

  List<int> chosens = [];

  @override
  void initState() {
    chosens = generateRandomNumbers(
      int.parse(widget.chosens),
      int.parse(widget.players),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ใครโดน ดื่ม!!",
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: int.parse(widget.players),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              chosens: chosens,
              index: index,
            );
          }),
    );
  }
}

class Card extends StatefulWidget {
  final int index;
  final List<int> chosens;

  const Card({super.key, required this.index, required this.chosens});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  bool toggle = false;
  bool isChosen = false;

  @override
  void initState() {
    isChosen = widget.chosens.contains(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          toggle = true;
        });
      },
      child: toggle
          ? isChosen
              ? Container(
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: const Center(child: Text("ดื่ม")),
                )
              : Container(
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: const Center(child: Text("รอด")),
                )
          : Container(
              decoration: const BoxDecoration(color: Colors.amber),
              child: const Center(child: Text("จิ้ม")),
            ),
    );
  }
}
