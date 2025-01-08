import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> cryptos = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'price': 'R\$ 338848.00',
      'image': 'bitcoin.png',
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'price': 'R\$ 13224.82',
      'image': 'ethereum.png',
    },
    {
      'name': 'Tether',
      'symbol': 'USDT',
      'price': 'R\$ 5.60',
      'image': 'tether.png',
    },
    {
      'name': 'BNB',
      'symbol': 'BNB',
      'price': 'R\$ 3179.60',
      'image': 'bnb.png',
    },
    {
      'name': 'Solana',
      'symbol': 'SOL',
      'price': 'R\$ 780.32',
      'image': 'solana.png',
    },
    {
      'name': 'USDC',
      'symbol': 'USDC',
      'price': 'R\$ 5.60',
      'image': 'usd.png',
    },
    {
      'name': 'XRP',
      'symbol': 'XRP',
      'price': 'R\$ 2.93',
      'image': 'xrp.png',
    },
    {
      'name': 'Lido Staked Ether',
      'symbol': 'STETH',
      'price': 'R\$ 13222.60',
      'image': 'steth.png'
    },
    {
      'name': 'Dogecoin',
      'symbol': 'DOGE',
      'price': 'R\$ 0.60',
      'image': 'dogecoin.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preços de Criptomoedas'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: cryptos.length,
        itemBuilder: (context, index) {
          final crypto = cryptos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Image.asset(
                  'assets/images/${crypto['image']}',
                  width: 40,
                  height: 40,
                ),
                title: Text(
                  crypto['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(crypto['symbol']),
                trailing: Text(
                  crypto['price'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
