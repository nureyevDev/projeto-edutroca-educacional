import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int itemSelecionado = 0;
  String categoriaSelecionada = 'Todos';
  String pesquisa = '';

  final List<Anuncio> anuncios = const [
    Anuncio(
      titulo: 'Livro de Cálculo I',
      categoria: 'Livros',
      tipo: 'Venda',
      preco: 'R\$ 35,00',
      local: 'Campus Teresina Central',
      icone: Icons.menu_book,
      cor: Color(0xFFEDE7F6),
    ),
    Anuncio(
      titulo: 'Jaleco branco',
      categoria: 'Laboratório',
      tipo: 'Troca',
      preco: 'Troca',
      local: 'Campus Teresina Zona Sul',
      icone: Icons.science_outlined,
      cor: Color(0xFFE8F5E9),
    ),
    Anuncio(
      titulo: 'Apostila de Química',
      categoria: 'Apostilas',
      tipo: 'Doação',
      preco: 'Doação',
      local: 'Campus Parnaíba',
      icone: Icons.description_outlined,
      cor: Color(0xFFFFF3E0),
    ),
    Anuncio(
      titulo: 'Camisa do fardamento',
      categoria: 'Fardamentos',
      tipo: 'Venda',
      preco: 'R\$ 25,00',
      local: 'Campus Floriano',
      icone: Icons.checkroom_outlined,
      cor: Color(0xFFE3F2FD),
    ),
  ];

  List<Anuncio> get anunciosFiltrados {
    return anuncios.where((anuncio) {
      final correspondeCategoria = categoriaSelecionada == 'Todos' ||
          anuncio.categoria == categoriaSelecionada;
      final correspondePesquisa = pesquisa.trim().isEmpty ||
          anuncio.titulo.toLowerCase().contains(pesquisa.toLowerCase());
      return correspondeCategoria && correspondePesquisa;
    }).toList();
  }

  void abrirDetalhes(Anuncio anuncio) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                anuncio.titulo,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF673AB7),
                ),
              ),
              const SizedBox(height: 12),
              Text('Categoria: ${anuncio.categoria}'),
              Text('Tipo de oferta: ${anuncio.tipo}'),
              Text('Local: ${anuncio.local}'),
              const SizedBox(height: 16),
              Text(
                anuncio.preco,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4CAF50),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(this.context).showSnackBar(
                      const SnackBar(
                        content: Text('Mensagem enviada ao anunciante.'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.chat_bubble_outline),
                  label: const Text('Tenho interesse'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF673AB7),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_edutroca_transparente.png',
              width: 84,
              height: 42,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Você não possui novas notificações.')),
                );
              },
              icon: const Icon(Icons.notifications_none, color: Color(0xFF673AB7)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Olá, estudante!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D2D2D),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Encontre materiais para sua jornada acadêmica.',
                style: TextStyle(color: Color(0xFF777777), fontSize: 14),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (valor) => setState(() => pesquisa = valor),
                decoration: InputDecoration(
                  hintText: 'O que você está procurando?',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF673AB7)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Categorias',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ['Todos', 'Livros', 'Apostilas', 'Fardamentos', 'Laboratório']
                      .map((categoria) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(categoria),
                              selected: categoriaSelecionada == categoria,
                              selectedColor: const Color(0xFF673AB7),
                              labelStyle: TextStyle(
                                color: categoriaSelecionada == categoria
                                    ? Colors.white
                                    : const Color(0xFF555555),
                              ),
                              onSelected: (_) => setState(() => categoriaSelecionada = categoria),
                            ),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ofertas recentes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${anunciosFiltrados.length} itens',
                    style: const TextStyle(color: Color(0xFF777777)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (anunciosFiltrados.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: Text('Nenhum anúncio encontrado.')),
                )
              else
                ...anunciosFiltrados.map(
                  (anuncio) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () => abrirDetalhes(anuncio),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Container(
                                width: 62,
                                height: 62,
                                decoration: BoxDecoration(
                                  color: anuncio.cor,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(anuncio.icone, color: const Color(0xFF673AB7), size: 30),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      anuncio.titulo,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      anuncio.local,
                                      style: const TextStyle(color: Color(0xFF777777), fontSize: 12),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      anuncio.preco,
                                      style: const TextStyle(
                                        color: Color(0xFF4CAF50),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right, color: Color(0xFF673AB7)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('A tela de novo anúncio será adicionada depois.')),
          );
        },
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Anunciar'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: itemSelecionado,
        onDestinationSelected: (indice) => setState(() => itemSelecionado = indice),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Mensagens'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}

class Anuncio {
  final String titulo;
  final String categoria;
  final String tipo;
  final String preco;
  final String local;
  final IconData icone;
  final Color cor;

  const Anuncio({
    required this.titulo,
    required this.categoria,
    required this.tipo,
    required this.preco,
    required this.local,
    required this.icone,
    required this.cor,
  });
}
