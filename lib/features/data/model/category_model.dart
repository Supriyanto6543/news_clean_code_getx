class CategoryModel {
  final String image;
  final String title;
  final int id;

  CategoryModel({required this.image, required this.title, required this.id});

  static List<CategoryModel> data = [
    CategoryModel(
        image:
            'https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg',
        title: 'business',
        id: 1),
    CategoryModel(
        image:
            'https://st.depositphotos.com/1053646/4172/i/600/depositphotos_41721217-stock-photo-revolution.jpg',
        title: 'entertainment',
        id: 2),
    CategoryModel(
        image:
            'https://images04.military.com/sites/default/files/styles/full/public/2019-07/neller-berger-change-of-command-1800.jpg',
        title: 'general',
        id: 3),
    CategoryModel(
        image:
            'https://img.freepik.com/free-vector/healthy-people-carrying-different-icons_53876-66139.jpg',
        title: 'health',
        id: 4),
    CategoryModel(
        image:
            'https://img.freepik.com/free-vector/science-word-theme_23-2148540555.jpg',
        title: 'science',
        id: 5),
    CategoryModel(
        image:
            'https://t3.ftcdn.net/jpg/02/78/42/76/360_F_278427683_zeS9ihPAO61QhHqdU1fOaPk2UClfgPcW.jpg',
        title: 'sports',
        id: 6),
    CategoryModel(
        image:
            'https://www.shutterstock.com/image-photo/businessman-using-mobile-smart-phone-260nw-1932042689.jpg',
        title: 'technology',
        id: 7),
  ];
}
