import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Livro {
  final String titulo;
  final String autor;

  Livro({required this.titulo, required this.autor});
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLivros(),
    );
  }
}

class TelaLivros extends StatelessWidget {
  TelaLivros({super.key});

  final List<Livro> livros = [
    Livro(titulo: 'Harry potter', autor: 'Você sabe quem'),
    Livro(titulo: '1984', autor: 'George Orwell'),
    Livro(titulo: 'Lovely War', autor: 'Julie Berry'),
    Livro(titulo: 'Jantar Secreto', autor: 'Raphael Montes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Livros')),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(livro.titulo),
              subtitle: Text(livro.autor),
            ),
          );
        },
      ),
    );
  }
}