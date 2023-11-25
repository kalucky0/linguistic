import 'package:flutter/material.dart';

import '/widgets/comments.dart';
import '/widgets/other_languages.dart';
import '/widgets/string_editor.dart';
import '/widgets/translations_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showPreview = false;
  bool showComments = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English'),
        actions: [
          IconButton(
            onPressed: () => setState(() => showPreview = !showPreview),
            icon: const Icon(Icons.image_outlined),
            tooltip: 'Toggle preview',
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () => setState(() => showComments = !showComments),
            icon: const Icon(Icons.message_outlined),
            tooltip: 'Toggle comments',
          ),
          const SizedBox(width: 8),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor.withOpacity(.5),
              ),
            ),
          ),
        ),
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: TranslationsList(),
            ),
            Container(
              color: Theme.of(context).dividerColor.withOpacity(.5),
              width: 1,
            ),
            const Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StringEditor(),
                      SizedBox(height: 4),
                      OtherLanguages(),
                    ],
                  ),
                ),
              ),
            ),
            if (showPreview)
              Container(
                color: Theme.of(context).dividerColor.withOpacity(.5),
                width: 1,
              ),
            Visibility(
              visible: showPreview,
              child: Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                  child: Center(
                    child: Image.asset('assets/test_screenshot.png'),
                  ),
                ),
              ),
            ),
            if (showComments)
              Container(
                color: Theme.of(context).dividerColor.withOpacity(.5),
                width: 1,
              ),
            Visibility(
              visible: showComments,
              child: const Expanded(
                flex: 2,
                child: Comments(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
