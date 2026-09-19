import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Aluno {
  final String nome;
  final double nota;

  Aluno({required this.nome, required this.nota});
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaAlunos(),
    );
  }
}

class TelaAlunos extends StatelessWidget {
  TelaAlunos({super.key});

  final List<Aluno> alunos = [
    Aluno(nome: 'Renan', nota: 9.5),
    Aluno(nome: 'Ly', nota: 8.3),
    Aluno(nome: 'Carlos', nota: 7.8),
    Aluno(nome: 'Felipe', nota: 10.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Alunos')),
      body: ListView.builder(
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final aluno = alunos[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(aluno.nome),
              subtitle: Text('Nota: ${aluno.nota}'),
            ),
          );
        },
      ),
    );
  }
}