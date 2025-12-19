import 'package:flutter/material.dart';
import 'utils/browser_title.dart';

class ScreenSizePage extends StatefulWidget {
  const ScreenSizePage({super.key});

  @override
  State<ScreenSizePage> createState() => _ScreenSizePageState();
}

class _ScreenSizePageState extends State<ScreenSizePage> {
  String _getDeviceType(double width) {
    if (width < 600) {
      return 'phone';
    } else if (width < 1024) {
      return 'tablet';
    } else {
      return 'desktop';
    }
  }

  void _updateBrowserTitle(String deviceType) {
    BrowserTitle.set(
      '${deviceType.toUpperCase()} View',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          final deviceType = _getDeviceType(width);
          
          // Обновляем заголовок вкладки при изменении размера
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _updateBrowserTitle(deviceType);
          });

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple.shade100,
                  Colors.deepPurple.shade50,
                ],
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Screen Size',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade700,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSizeDisplay('Width', width.toInt()),
                        const SizedBox(width: 24),
                        _buildSizeDisplay('Height', height.toInt()),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade700,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        deviceType.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSizeDisplay(String label, int value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '$value px',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade700,
          ),
        ),
      ],
    );
  }
}