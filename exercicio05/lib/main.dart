import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Produto {
  final String nome;
  final double preco;
  final int quantidade;

  Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaEstoque(),
    );
  }
}

class TelaEstoque extends StatefulWidget {
  const TelaEstoque({super.key});

  @override
  State<TelaEstoque> createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final quantidadeController = TextEditingController();

  final List<Produto> produtos = [];

  void adicionar() {
    final nome = nomeController.text.trim();
    final preco = double.tryParse(precoController.text);
    final quantidade = int.tryParse(quantidadeController.text);

    if (nome.isEmpty || preco == null || quantidade == null) return;

    setState(() {
      produtos.add(
        Produto(
          nome: nome,
          preco: preco,
          quantidade: quantidade,
        ),
      );
    });

    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();
  }

  void remover(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estoque Simples')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço'),
            ),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: adicionar,
              child: const Text('Cadastrar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: produtos.isEmpty
                  ? const Center(
                      child: Text('Nenhum produto cadastrado.'),
                    )
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        final produto = produtos[index];

                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.inventory_2),
                            title: Text(produto.nome),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)} • Estoque: ${produto.quantidade}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => remover(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}