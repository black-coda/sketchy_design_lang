import 'package:flutter/widgets.dart';

import 'critique_board.dart';
import 'dashboard.dart';
import 'docs_viewer.dart';
import 'expense_tracker.dart';
import 'live_chat.dart';
import 'quiz_card.dart';
import 'spotlight_panel.dart';
import 'whiteboard_palette.dart';

class SketchyExampleEntry {
  const SketchyExampleEntry({
    required this.id,
    required this.title,
    required this.description,
    required this.builder,
  });
  final String id;
  final String title;
  final String description;
  final WidgetBuilder builder;
}

const List<SketchyExampleEntry> sketchyExamples = [
  SketchyExampleEntry(
    id: 'spotlight-panel',
    title: 'Spotlight Panel',
    description:
        'Hero card with annotations calling out the key primary/secondary actions.',
    builder: SketchySpotlightPanelExample.builder,
  ),
  SketchyExampleEntry(
    id: 'wireframe-dashboard',
    title: 'Wireframe Productivity Dashboard',
    description:
        'Desktop layout with sidebar navigation, draggable cards, and sketchy charts.',
    builder: WireframeDashboardExample.builder,
  ),
  SketchyExampleEntry(
    id: 'critique-board',
    title: 'Collaborative Design Critique Board',
    description:
        'Gallery grid that overlays badges and hover annotations on uploaded work.',
    builder: CollaborativeCritiqueBoardExample.builder,
  ),
  SketchyExampleEntry(
    id: 'expense-tracker',
    title: 'Mobile Expense Tracker Form',
    description:
        'Form controls with validation-driven annotations and sketchy toggles.',
    builder: ExpenseTrackerExample.builder,
  ),
  SketchyExampleEntry(
    id: 'quiz-card',
    title: 'Education Quiz Card',
    description:
        'Single quiz card showing chips, progress, and celebratory highlights.',
    builder: QuizCardExample.builder,
  ),
  SketchyExampleEntry(
    id: 'docs-viewer',
    title: 'Developer Documentation Viewer',
    description:
        'Tab-based viewer with inline tooltips, dividers, and hover effects.',
    builder: DocsViewerExample.builder,
  ),
  SketchyExampleEntry(
    id: 'whiteboard-palette',
    title: 'Hackathon Whiteboard Palette',
    description:
        'Canvas built with rough primitives plus floating sliders and switches.',
    builder: WhiteboardPaletteExample.builder,
  ),
  SketchyExampleEntry(
    id: 'live-chat',
    title: 'Customer Support Live Chat',
    description:
        'Chat transcript with rough list tiles, typing indicators, and suggestion chips.',
    builder: LiveChatExample.builder,
  ),
];
