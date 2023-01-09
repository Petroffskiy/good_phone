import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({Key? key,   @PathParam('id') required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Hello"));
  }
}
