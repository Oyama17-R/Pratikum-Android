import 'package:flutter/material.dart';

class Studikasus03 extends StatefulWidget {
  const Studikasus03({super.key});

  @override
  State<Studikasus03> createState() => _Studikasus03State();
}

class _Studikasus03State extends State<Studikasus03> {
  String? pilihan;
  String url = '';
  final List<String> anime = [
    'Dandadan',
    'One Punch',
    'SPY×FAMILY',
    'Sword Art Online',
    'Seirei Gensouki',
    'Demon Slayer',
    'Horimiya',
    'Demon Slayer Movie'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Favorit'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Anime Favorit'),
              value: pilihan,
              onChanged: (String? pilihannya) {
                setState(() {
                  pilihan = pilihannya;
                  if (pilihan == 'Dandadan') {
                    url =
                        'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/01/2024/10/02/Screenshot_142-3716872193.jpg';
                  } else if (pilihan == 'One Punch') {
                    url =
                        'https://cdn11.bigcommerce.com/s-9yct61arm5/images/stencil/1280x1280/products/17801/17770/Saitama-(One-Punch-Man)-Anime-One-Punch-Man-APC001A__20920.1672770382.jpg?c=1';
                  } else if (pilihan == 'SPY×FAMILY') {
                    url =
                        'https://images.tokopedia.net/img/JFrBQq/2022/9/8/634a4af3-4680-4754-b19f-058ddde2e879.jpg';
                  } else if (pilihan == 'Sword Art Online') {
                    url =
                        'https://cdn.idntimes.com/content-images/duniaku/post/20220930/e3a0a91cbe80262b88c6bf1f4012a238jpg-at-1200w-630h-1e-1c-1f-b8043fad6ce4b041012b07ac99f89692.jpg';
                  } else if (pilihan == 'Seirei Gensouki') {
                    url =
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8Ut9BriZgyxC8D8nWL8_9P5_GVlyixuI9T_qlKOjLmYaFgkYU6YcXkJ04EyCrwRzzlNc&usqp=CAU';
                  } else if (pilihan == 'Demon Slayer') {
                    url =
                        'https://awsimages.detik.net.id/community/media/visual/2024/05/29/demon-slayer-kimetsu-no-yaiba-to-the-hashira-training-season-4.jpeg?w=700&q=90';
                  } else if (pilihan == 'Horimiya') {
                    url =
                        'https://cdn.idntimes.com/content-images/duniaku/post/20210723/a-scene-from-episode-six-of-horimiya-season-one-376b366bbd730d5444a3657a7cdda79b.jpg';
                  } else if (pilihan == 'Demon Slayer Movie') {
                    url =
                        'https://cdn.antaranews.com/cache/1200x800/2024/07/01/Screenshot-193-1.jpg.jpg';
                  }
                });
              },
              items: anime.map<DropdownMenuItem<String >>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            buildImageCard(url),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(String imageUrl) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null),
                );
              },
              errorBuilder: (context, error, stackTrace) => Center(
                child: Text('Error: ${error.toString()}'),
              ),
            )));
  }
}