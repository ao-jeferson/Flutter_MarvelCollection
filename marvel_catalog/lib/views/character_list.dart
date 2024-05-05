// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:marvel_catalog/shared/components/mv_drawer.dart';
// import 'package:marvel_catalog/stores/character_store.dart';

// // class MyApp extends StatelessWidget {
// //   final characterStore = CharacterStore();

// //   MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Marvel Characters',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Marvel Characters'),
// //         ),
// //         body: CharacterList(characterStore: characterStore),
// //       ),
// //     );
// //   }
// // }

// class CharacterList extends StatefulWidget {
//   final CharacterStore characterStore = CharacterStore();

//   CharacterList({super.key});

//   // const CharacterList({super.key, required this.characterStore});

//   @override
//   _CharacterListState createState() => _CharacterListState();
// }

// class _CharacterListState extends State<CharacterList> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   // void initState() {
//   //   super.initState();
//   //   widget.characterStore.fetchCharacters();
//   //   _scrollController.addListener(_scrollListener);
//   // }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // void _scrollListener() {
//   //   if (_scrollController.init >=
//   //           _scrollController.position.maxScrollExtent &&
//   //       !_scrollController.position.outOfRange) {
//   //     widget.characterStore.fetchCharacters();
//   //   }
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Home'),
// //       ),
// //       drawer: const MvDrawer(),
// //         Observer(
// //           builder: (context) {
// //             return ListView.builder(
// //               controller: _scrollController,
// //               itemCount: widget.characterStore.characters.length,
// //               itemBuilder: (context, index) {
// //                 final character = widget.characterStore.characters[index];
// //                 return ListTile(
// //                   title: Text(character.name),
// //                   //subtitle: Text(character.),
// //                 );
// //               },
// //             );
// //           },   
// //     );
// //   }
// // }
