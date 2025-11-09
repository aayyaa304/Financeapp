import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/atm_card.dart';
import '../models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        title: const Text(
          'Finance Mate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF03396C),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFFB3CDE0),
        centerTitle: true,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Title =====    
              const Text(
                'My Cards',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF03396C),
                ),
              ),
              const SizedBox(height: 12),

              // ===== Banner Cards =====
              SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AtmCard(
                      bankName: 'Bank Mandiri',
                      cardNumber: '**** 2345',
                      balance: 'Rp12.500.000',
                      color1: Color(0xFF002984),
                      color2: Color(0xFFFFC400),
                    ),
                    AtmCard(
                      bankName: 'Bank BRI',
                      cardNumber: '**** 8765',
                      balance: 'Rp5.350.000',
                      color1: Color(0xFF0D47A1),
                      color2: Color(0xFF1976D2),
                    ),
                    AtmCard(
                      bankName: 'Bank BCA',
                      cardNumber: '**** 3004',
                      balance: 'Rp130.350.000',
                      color1: Color(0xFF004481),
                      color2: Color(0xFF0078D4),
                    ),
                    AtmCard(
                      bankName: 'Bank BNI',
                      cardNumber: '**** 2505',
                      balance: 'Rp100.500.000',
                      color1: Color(0xFFFF6F00),
                      color2: Color(0xFF00695C),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ===== Quick Access Modern =====
              const Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF03396C),
                ),
              ),
              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 140,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final items = [
                    {
                      'icon': Icons.health_and_safety,
                      'title': 'Health',
                      'subtitle': '3 transaksi minggu ini',
                      'colors': [Color(0xFFB2FEFA), Color(0xFF0ED2F7)],
                    },
                    {
                      'icon': Icons.travel_explore,
                      'title': 'Travel',
                      'subtitle': '1 perjalanan bulan ini',
                      'colors': [Color(0xFF89F7FE), Color(0xFF66A6FF)],
                    },
                    {
                      'icon': Icons.fastfood,
                      'title': 'Food',
                      'subtitle': 'Rp1.2jt bulan ini',
                      'colors': [Color(0xFFFFC371), Color(0xFFFF5F6D)],
                    },
                    {
                      'icon': Icons.event,
                      'title': 'Event',
                      'subtitle': '2 event aktif',
                      'colors': [Color(0xFFFF9A9E), Color(0xFFFAD0C4)],
                    },
                  ];

                  final item = items[index];
                  bool isPressed = false;

                  return StatefulBuilder(
                    builder: (context, setState) => GestureDetector(
                      onTapDown: (_) => setState(() => isPressed = true),
                      onTapUp: (_) => setState(() => isPressed = false),
                      onTapCancel: () => setState(() => isPressed = false),
                      child: AnimatedScale(
                        scale: isPressed ? 0.95 : 1.0,
                        duration: const Duration(milliseconds: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: List<Color>.from(item['colors'] as List),
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 26,
                                    backgroundColor: Colors.white.withOpacity(0.3),
                                    child: Icon(
                                      item['icon'] as IconData,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    item['title'] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['subtitle'] as String,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).animate(delay: Duration(milliseconds: index * 150)).fadeIn(duration: 600.ms).slideY(begin: 0.2),
                  );
                },
              ),

              const SizedBox(height: 28),

              // ===== Recent Transactions =====
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF03396C),
                ),
              ),
              const SizedBox(height: 12),

              ...transactions.asMap().entries.map((entry) {
                int index = entry.key;
                final t = entry.value;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(
                        t.category == 'Food'
                            ? Icons.fastfood
                            : t.category == 'Travel'
                                ? Icons.travel_explore
                                : t.category == 'Health'
                                    ? Icons.health_and_safety
                                    : t.category == 'Event'
                                        ? Icons.event
                                        : Icons.account_balance_wallet,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    title: Text(
                      t.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      t.category,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    trailing: Text(
                      t.amount,
                      style: TextStyle(
                        color: t.amount.startsWith('-')
                            ? Colors.redAccent
                            : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 400.ms, delay: (index * 120).ms)
                    .slideY(begin: 0.3, end: 0, duration: 400.ms);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
