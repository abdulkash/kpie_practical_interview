import 'package:flutter/material.dart';
import 'package:kpie_practical_interview/extensions/hex_color.dart';
import 'package:kpie_practical_interview/view/widgets/home_action_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final yellow = "#FFD700".fromHex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/bg.png',
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.srcOver,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        'assets/img/logo.png',
                        height: 55.8,
                        width: 70,
                      ),
                      const Text(
                        'HAV’I-LAH\nHOME FINANCE',
                        style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'BUYING PROPERTIES\nMADE EASY',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: yellow),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Take a tour',
                            style: TextStyle(color: yellow, fontSize: 15),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: yellow,
                            size: 16,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Welcome, James',
                        style: TextStyle(color: yellow, fontFamily: 'Montserrat', fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeActionsWidget(yellow: yellow, img: 'assets/img/home.png', title: 'Need a\nProperty?', desc: 'Own a Property & Pay with Ease'),
                      HomeActionsWidget(yellow: yellow, img: 'assets/img/agents.png', title: 'Agents &\nDevelopers', desc: 'Post and Sell Your Properties'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeActionsWidget(yellow: yellow, img: 'assets/img/mortgage.png', title: 'Mortgage\nFinancing', desc: 'Access funds to power that ongoing project'),
                      HomeActionsWidget(yellow: yellow, img: 'assets/img/user.png', title: 'My Account\nArea', desc: 'Take me to my Dashboard'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
