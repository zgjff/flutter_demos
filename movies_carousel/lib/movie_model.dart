class MovieModel {
  const MovieModel(
      {required this.title, required this.desc, required this.pic});
  final String title, desc, pic;
}

const List<MovieModel> movies = [
  MovieModel(
    title: 'Black Widow',
    desc: 'Black Widow',
    pic:
        'https://www.moviepostersgallery.com/wp-content/uploads/2020/08/Blackwidow2.jpg',
  ),
  MovieModel(
    title: 'The Suicide Squad',
    desc: 'The Suicide Squad',
    pic:
        'https://static.wikia.nocookie.net/headhuntersholosuite/images/7/77/Suicide_Squad%2C_The.jpg/revision/latest?cb=20210807172814',
  ),
  MovieModel(
    title: '寒战',
    desc: '寒战',
    pic:
        'https://img.zcool.cn/community/010997556ff4f10000009fcb1ee872.jpg@1280w_1l_2o_100sh.jpg',
  ),
  MovieModel(
    title: '风声',
    desc: '风声',
    pic:
        'https://img.zcool.cn/community/01d8305d59359aa8012187f483d3db.jpg@1280w_1l_2o_100sh.jpg',
  ),
  MovieModel(
    title: '影',
    desc: '影',
    pic:
        'https://img.zcool.cn/community/011b2b5b9a2b21a801213deaa2f0d1.jpg@2o.jpg',
  ),
  MovieModel(
    title: '雷神3',
    desc: '雷神3',
    pic: 'https://',
  ),
  MovieModel(
    title: '唐人街探案3',
    desc: '唐人街探案3',
    pic:
        'https://ts1.cn.mm.bing.net/th/id/R-C.cb27e59189f77d3fcb9c87c8bba8ecda?rik=uSSHsdV7ygdRlw&riu=http%3a%2f%2fwww.wafsy.com%2fuploads%2fueditor%2fimage%2f20210215%2f1613355896114738.jpeg&ehk=0549usPRJ2Wy%2f96rWjLAYXTkhS%2bybrGzF2nQEN655hU%3d&risl=&pid=ImgRaw&r=0',
  ),
];
