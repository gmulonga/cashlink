import 'package:cashlink/config/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            // Balance Container
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1D546C),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  // Circle decorations
                  Positioned(
                    right: -60,
                    top: -40,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -50,
                    top: -30,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -40,
                    top: -20,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -60,
                    top: 20,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.08), width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -70,
                    top: 40,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.08), width: 2),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -80,
                    top: 60,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withOpacity(0.08), width: 2),
                      ),
                    ),
                  ),
                  // Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 30,),
                      Text(
                        'Your Balance',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,

                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic,
                         children: [
                           Text('Ksh:', style: TextStyle(color: kWhite, fontSize: 15),),
                           SizedBox(width: 10,),
                           Text(
                          '209,891.21',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                                               ),]
                       ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(24),
                          ),

                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildActionButton('Deposit', Icons.wallet, kPrimary),
                                _buildActionButton('Withdraw', Icons.open_with_rounded, kPrimary),
                                _buildActionButton('Transfer', Icons.arrow_upward, kPrimary),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[600]),
                    const SizedBox(width: 12),
                    Text(
                      'Try "amazon"',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Stock Activities Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Stock Activities',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Text('This month', style: TextStyle(color: Colors.black)),
                        SizedBox(width: 8),
                        Icon(Icons.keyboard_arrow_down, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Stock List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildStockCard('MSFT', 'Microsoft Co.', '\$234.53', '+10.21%', true),
                  const SizedBox(height: 10),
                  _buildStockCard('NVDA', 'NVIDIA Corp.', '\$142.76', '-2.34%', false),
                  const SizedBox(height: 10),
                  _buildStockCard('SAF', 'Safaricom PLC.', '\$132.76', '+2.34%', true),
                  const SizedBox(height: 10),
                  _buildStockCard('BRITAM', 'BRITAM Corp.', '\$332.76', '+20.34%', true),
                  const SizedBox(height: 10),
                  _buildStockCard('CIC', 'CIC Ins.', '\$142.76', '-2.34%', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color == const Color(0xFFCDFF00) ? Colors.black : Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildStockCard(String symbol, String company, String price, String change, bool isPositive) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: kPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.business, color: kPrimary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(symbol, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                Text(company, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            height: 40,
            child: CustomPaint(
              painter: MiniChartPainter(isPositive: isPositive),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              Text(
                change,
                style: TextStyle(fontSize: 14, color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniChartPainter extends CustomPainter {
  final bool isPositive;

  MiniChartPainter({required this.isPositive});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (isPositive ? Colors.green : Colors.red).withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..color = isPositive ? Colors.green : Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.lineTo(size.width * 0.1, size.height * 0.5);
    path.lineTo(size.width * 0.4, size.height * 0.6);
    path.lineTo(size.width * 0.6, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * (isPositive ? 0.4 : 0.2));
    path.lineTo(size.width, size.height * (isPositive ? 0.2 : 0.1));

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, paint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}