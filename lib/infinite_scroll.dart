import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class InfinitScroll extends StatefulWidget {
  const InfinitScroll({super.key});

  @override
  State<InfinitScroll> createState() => _InfinitScrollState();
}

class _InfinitScrollState extends State<InfinitScroll> {
  final controller = ScrollController();
  final List items = [];
  int page = 1;
  bool hasmore = true;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    int limit = 25;
    final url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List newItems = json.decode(
        response.body,
      );
      setState(() {
        page++;
        isLoading = false;
        if (newItems.length < limit) {
          hasmore = false;
        }

        items.addAll(newItems.map<String>((item) {
          final number = item["id"];
          return 'Item $number';
        }).toList());
      });
    }
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasmore = true;
      page = 0;
      items.clear();
    });
    fetch();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Infinite Scroll'),
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.builder(
            controller: controller,
            itemCount: items.length + 1,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              if (index < items.length) {
                final item = items[index];
                return ListTile(
                  title: Text('Item $item'),
                );
              } else {
                return Center(
                  child: hasmore
                      ? const CircularProgressIndicator()
                      : const Text('No more items'),
                );
              }
            },
          ),
        ));
  }
}
