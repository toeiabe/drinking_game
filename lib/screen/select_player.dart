import 'package:drink_game/screen/game_screen.dart';
import 'package:flutter/material.dart';

class SelectPlayer extends StatelessWidget {
  SelectPlayer({super.key});

  final TextEditingController players = TextEditingController();
  final TextEditingController chosen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ใครโดน ดื่ม!!",
          style: TextStyle(color: Colors.deepPurple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'จำนวนผู้เล่น',
              ),
              controller: players,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'จำนวนคนดื่ม',
                ),
                controller: chosen,
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (players.text.trim() == '' || chosen.text.trim() == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('กรุณาระบุจำนวนให้ครบ'),
                        action: SnackBarAction(
                          label: 'ปิด',
                          onPressed: () {
                            // Code to execute.
                          },
                        ),
                      ),
                    );
                  } else if (int.parse(players.text) >=
                      int.parse(chosen.text)) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GameScreen(
                              players: players.text,
                              chosens: chosen.text,
                            )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            const Text('จำนวนคนดื่มห้ามมากกว่าจำนวนผู้เล่น!'),
                        action: SnackBarAction(
                          label: 'ปิด',
                          onPressed: () {
                            // Code to execute.
                          },
                        ),
                      ),
                    );
                  }
                },
                child: const Text("ไป!!"))
          ],
        ),
      ),
    );
  }
}
