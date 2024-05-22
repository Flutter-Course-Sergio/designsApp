import 'package:flutter/material.dart';

class SliverlistPage extends StatelessWidget {
  const SliverlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _MainScroll());
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
  ];

  _MainScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.red,
          title: Text('Hola mundo'),
        ),
        SliverList(delegate: SliverChildListDelegate(items))
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                decoration: const BoxDecoration(color: Color(0xfff7cdd5)),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class _TodoList extends StatelessWidget {
  const _TodoList();

  @override
  Widget build(BuildContext context) {
    final items = [
      const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
      const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
      const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
      const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
      const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
      const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
      const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    ];

    return ListView.builder(
        itemCount: items.length, itemBuilder: (context, index) => items[index]);
  }
}

class _TodoItem extends StatelessWidget {
  final String text;
  final Color color;

  const _TodoItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
