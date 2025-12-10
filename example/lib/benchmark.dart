// example/lib/benchmark_page.dart
//
// Visual performance benchmark for SketchyCircularProgressIndicator.
//
// Add this page to your example app to test rendering performance.
// Run with: flutter run --profile -d <device>

import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';

void main() {
  runApp(SketchyApp(title: 'Sketchy Benchmark', home: const BenchmarkPage()));
}

class BenchmarkPage extends StatefulWidget {
  const BenchmarkPage({super.key});

  @override
  State<BenchmarkPage> createState() => _BenchmarkPageState();
}

class _BenchmarkPageState extends State<BenchmarkPage> {
  _BenchmarkMode _mode = _BenchmarkMode.single;
  bool _showStats = true;

  @override
  Widget build(BuildContext context) => SketchyScaffold(
    appBar: const SketchyAppBar(
      title: SketchyText('Progress Indicator Benchmark'),
    ),
    body: Column(
      children: [
        // Mode selector
        Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: _BenchmarkMode.values.map((mode) {
              final isSelected = _mode == mode;
              return GestureDetector(
                onTap: () => setState(() => _mode = mode),
                child: SketchyFrame(
                  fill: isSelected ? SketchyFill.solid : SketchyFill.none,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: SketchyText(mode.label),
                ),
              );
            }).toList(),
          ),
        ),

        // Stats toggle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SketchyText('Show Stats: '),
              const SizedBox(width: 8),
              SketchyCheckbox(
                value: _showStats,
                onChanged: (v) => setState(() => _showStats = v ?? true),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Info text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SketchyText(
            'Mode: ${_mode.label} (${_mode.count} indicators)',
            style: const TextStyle(fontSize: 12),
          ),
        ),

        const SizedBox(height: 8),

        // Benchmark content
        Expanded(
          child: _showStats
              ? _FrameStatsOverlay(child: _buildContent())
              : _buildContent(),
        ),
      ],
    ),
  );

  Widget _buildContent() {
    switch (_mode) {
      case _BenchmarkMode.single:
        return const Center(child: SketchyCircularProgressIndicator(size: 100));

      case _BenchmarkMode.singleDeterminate:
        return const Center(child: _AnimatedProgressDemo());

      case _BenchmarkMode.grid4:
      case _BenchmarkMode.grid9:
      case _BenchmarkMode.grid16:
      case _BenchmarkMode.grid25:
      case _BenchmarkMode.grid100:
        return _buildGrid(_mode.crossAxisCount, _mode.count);

      case _BenchmarkMode.stress:
        return _buildGrid(15, _mode.count);
    }
  }

  Widget _buildGrid(int crossAxisCount, int count) => GridView.builder(
    padding: const EdgeInsets.all(16),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    ),
    itemCount: count,
    itemBuilder: (context, index) {
      // Alternate between determinate and indeterminate
      final value = index.isEven ? (index / count) : null;
      return SketchyCircularProgressIndicator(
        value: value,
        size: _mode == _BenchmarkMode.stress ? 24 : 40,
      );
    },
  );
}

enum _BenchmarkMode {
  single('Single', 1, 1),
  singleDeterminate('Animated', 1, 1),
  grid4('Grid 4', 4, 2),
  grid9('Grid 9', 9, 3),
  grid16('Grid 16', 16, 4),
  grid25('Grid 25', 25, 5),
  grid100('Grid 100', 100, 10),
  stress('Stress 225', 225, 15);

  const _BenchmarkMode(this.label, this.count, this.crossAxisCount);

  final String label;
  final int count;
  final int crossAxisCount;
}

/// Demonstrates animated determinate progress
class _AnimatedProgressDemo extends StatefulWidget {
  const _AnimatedProgressDemo();

  @override
  State<_AnimatedProgressDemo> createState() => _AnimatedProgressDemoState();
}

class _AnimatedProgressDemoState extends State<_AnimatedProgressDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SketchyCircularProgressIndicator(value: _controller.value, size: 100),
        const SizedBox(height: 16),
        SketchyText('${(_controller.value * 100).toInt()}%'),
      ],
    ),
  );
}

/// Overlay that displays frame timing statistics
class _FrameStatsOverlay extends StatefulWidget {
  const _FrameStatsOverlay({required this.child});

  final Widget child;

  @override
  State<_FrameStatsOverlay> createState() => _FrameStatsOverlayState();
}

class _FrameStatsOverlayState extends State<_FrameStatsOverlay> {
  final List<int> _frameTimes = [];
  DateTime? _lastFrameTime;
  int _frameCount = 0;
  double _fps = 0;
  double _avgFrameTime = 0;
  double _maxFrameTime = 0;
  double _minFrameTime = double.infinity;

  @override
  void initState() {
    super.initState();
    _scheduleFrame();
  }

  void _scheduleFrame() {
    SchedulerBinding.instance.addPostFrameCallback(_onFrame);
  }

  void _onFrame(Duration timestamp) {
    if (!mounted) return;

    final now = DateTime.now();
    if (_lastFrameTime != null) {
      final frameTimeUs = now.difference(_lastFrameTime!).inMicroseconds;
      _frameTimes.add(frameTimeUs);

      // Keep last 120 frames (2 seconds at 60fps)
      if (_frameTimes.length > 120) {
        _frameTimes.removeAt(0);
      }

      // Calculate stats
      if (_frameTimes.isNotEmpty) {
        final sum = _frameTimes.reduce((a, b) => a + b);
        _avgFrameTime = sum / _frameTimes.length / 1000; // Convert to ms
        _fps = _avgFrameTime > 0 ? 1000 / _avgFrameTime : 0;

        final max = _frameTimes.reduce((a, b) => a > b ? a : b);
        final min = _frameTimes.reduce((a, b) => a < b ? a : b);
        _maxFrameTime = max / 1000;
        _minFrameTime = min / 1000;
      }

      _frameCount++;

      // Update UI every 10 frames to reduce overhead
      if (_frameCount % 10 == 0) {
        setState(() {});
      }
    }
    _lastFrameTime = now;

    _scheduleFrame();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      widget.child,
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xF0000000),
            border: Border.all(color: const Color(0xFF333333)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatBox(
                label: 'FPS',
                value: _fps.toStringAsFixed(1),
                color: _getFpsColor(_fps),
              ),
              _StatBox(
                label: 'Avg',
                value: '${_avgFrameTime.toStringAsFixed(2)}ms',
                color: _getFrameTimeColor(_avgFrameTime),
              ),
              _StatBox(
                label: 'Min',
                value: '${_minFrameTime.toStringAsFixed(2)}ms',
                color: _getFrameTimeColor(_minFrameTime),
              ),
              _StatBox(
                label: 'Max',
                value: '${_maxFrameTime.toStringAsFixed(2)}ms',
                color: _getFrameTimeColor(_maxFrameTime),
              ),
              _StatBox(
                label: 'Frames',
                value: '$_frameCount',
                color: const Color(0xFFFFFFFF),
              ),
            ],
          ),
        ),
      ),
    ],
  );

  Color _getFpsColor(double fps) {
    if (fps >= 55) return const Color(0xFF4CAF50); // Green
    if (fps >= 30) return const Color(0xFFFFEB3B); // Yellow
    return const Color(0xFFF44336); // Red
  }

  Color _getFrameTimeColor(double ms) {
    if (ms <= 16.67) return const Color(0xFF4CAF50); // 60fps target
    if (ms <= 33.33) return const Color(0xFFFFEB3B); // 30fps
    return const Color(0xFFF44336);
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        label,
        style: const TextStyle(
          color: Color(0xFFAAAAAA),
          fontSize: 10,
          fontFamily: 'monospace',
        ),
      ),
      const SizedBox(height: 2),
      Text(
        value,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'monospace',
        ),
      ),
    ],
  );
}
