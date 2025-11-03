import 'package:cashlink/config/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              _buildSectionHeader("Trend"),
              _buildVehicleCard(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CashLink interest (Last 7 Months)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 200,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(
                              show: true,
                              drawVerticalLine: false,
                              horizontalInterval: 20,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: Colors.grey.shade200,
                                  strokeWidth: 1,
                                );
                              },
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  interval: 1,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    const style = TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    );
                                    Widget text;
                                    switch (value.toInt()) {
                                      case 0:
                                        text = Text('Jan', style: style);
                                        break;
                                      case 1:
                                        text = Text('Feb', style: style);
                                        break;
                                      case 2:
                                        text = Text('Mar', style: style);
                                        break;
                                      case 3:
                                        text = Text('Apr', style: style);
                                        break;
                                      case 4:
                                        text = Text('Jun', style: style);
                                        break;
                                      case 5:
                                        text = Text('Jul', style: style);
                                        break;
                                      case 6:
                                        text = Text('Aug', style: style);
                                        break;
                                      default:
                                        text = Text('', style: style);
                                        break;
                                    }
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: text,
                                    );
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                axisNameWidget: Text(
                                  '% Interest (p.a)',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 20,
                                  reservedSize: 42,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    return Text(
                                      value.toInt().toString(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            minX: 0,
                            maxX: 6,
                            minY: 0,
                            maxY: 20,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 6),
                                  FlSpot(1, 6),
                                  FlSpot(2, 8),
                                  FlSpot(3, 7),
                                  FlSpot(4, 9),
                                  FlSpot(5, 10),
                                  FlSpot(6, 14),
                                ],
                                isCurved: true,
                                gradient: LinearGradient(
                                  colors: [
                                    kPrimary,
                                    kPrimary,
                                  ],
                                ),
                                barWidth: 3,
                                isStrokeCapRound: true,
                                dotData: FlDotData(
                                  show: true,
                                  getDotPainter:
                                      (spot, percent, barData, index) =>
                                      FlDotCirclePainter(
                                        radius: 3,
                                        color: kPrimary,
                                        strokeWidth: 1,
                                        strokeColor: Colors.white,
                                      ),
                                ),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    colors: [
                                      kPrimary.withOpacity(0.1),
                                      kPrimary.withOpacity(0.05),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              _buildSectionHeader("Recent Market News"),
              _buildVehicleCard(
                child: Column(
                  children: [
                    _buildVehicleItem(
                      title: 'TESLA',
                      subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
                    ),
                    _buildDivider(),
                    _buildVehicleItem(title: 'NVDA', subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry...'),
                    _buildDivider(),
                    _buildVehicleItem(
                      title: 'TESLA',
                      subtitle: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleCard({required Widget child, VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: child,
      ),
    );
  }

  Widget _buildVehicleItem({required String title, required String subtitle}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nov 1 2025", style: TextStyle(color: Colors.grey),),
              Text("See More", style: TextStyle(color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 1, color: Colors.grey.shade100);
  }
}
