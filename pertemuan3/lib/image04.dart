import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard('https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/01/2024/10/02/Screenshot_142-3716872193.jpg'),
            buildImageCard('https://cdn11.bigcommerce.com/s-9yct61arm5/images/stencil/1280x1280/products/17801/17770/Saitama-(One-Punch-Man)-Anime-One-Punch-Man-APC001A__20920.1672770382.jpg?c=1'),
            buildImageCard('https://images.tokopedia.net/img/JFrBQq/2022/9/8/634a4af3-4680-4754-b19f-058ddde2e879.jpg'),
            buildImageCard('https://cdn.idntimes.com/content-images/duniaku/post/20220930/e3a0a91cbe80262b88c6bf1f4012a238jpg-at-1200w-630h-1e-1c-1f-b8043fad6ce4b041012b07ac99f89692.jpg'),
            buildImageCard('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8Ut9BriZgyxC8D8nWL8_9P5_GVlyixuI9T_qlKOjLmYaFgkYU6YcXkJ04EyCrwRzzlNc&usqp=CAU'),
            buildImageCard('https://awsimages.detik.net.id/community/media/visual/2024/05/29/demon-slayer-kimetsu-no-yaiba-to-the-hashira-training-season-4.jpeg?w=700&q=90'),
            buildImageCard('https://cdn.idntimes.com/content-images/duniaku/post/20210723/a-scene-from-episode-six-of-horimiya-season-one-376b366bbd730d5444a3657a7cdda79b.jpg'),
            buildImageCard('https://cdn.antaranews.com/cache/1200x800/2024/07/01/Screenshot-193-1.jpg.jpg'),
          ],
        ),
      ),
    );
  }
  Widget buildImageCard(String imageUrl){
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
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace){
            return Center( child: Text('Error: ${error.toString()}'),
            );
          },
        ),
      ),
    );
  }
}