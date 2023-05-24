import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CachedNetworkImage"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _sizedContainer(
                  CachedNetworkImage(
                    imageUrl:
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F5b%2Fd5%2Fc2%2F5bd5c27e8b8c73bd2bc642d6efc767cd.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647497530&t=26b41879a231f7075f1a0fef65dea01e",
                  ),
                  width: 350),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sizedContainer(
                    CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl:
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Farticle-fd.zol-img.com.cn%2Fg6%2FM00%2F0D%2F0F%2FChMkKWEch_eIGOZBAAHw1yOR1BcAAS4nQH4vjQAAfDv189.jpg&refer=http%3A%2F%2Farticle-fd.zol-img.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647498299&t=7b28f62ab76c3f18e2c2242824dd0580',
                    ),
                    width: 170,
                    height: 250,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  _sizedContainer(
                    CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                      imageUrl:
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202107%2F08%2F20210708111723_4f85f.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647498822&t=f083a6e1e4013e0151b61663877ba1fd',
                    ),
                    width: 170,
                    height: 250,
                  ),
                ],
              ),
              _sizedContainer(
                CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageUrl: 'https://via.placeholder.com/200x150',
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'https://via.placeholder.com/300x150',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          Colors.red,
                          BlendMode.colorBurn,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              CachedNetworkImage(
                imageUrl: 'https://via.placeholder.com/300x300',
                placeholder: (context, url) => const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 150,
                ),
                imageBuilder: (context, image) => CircleAvatar(
                  backgroundImage: image,
                  radius: 150,
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'https://notAvalid.uri',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  imageUrl: 'not a uri at all',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              _sizedContainer(
                CachedNetworkImage(
                  maxHeightDiskCache: 10,
                  imageUrl: 'https://via.placeholder.com/350x200',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fadeOutDuration: const Duration(seconds: 1),
                  fadeInDuration: const Duration(seconds: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sizedContainer(Widget child, {double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: child,
      ),
    );
  }
}
