import '../models/book.dart';

class BookRepository {
  final List<Book> _dummyBooks = [
    Book(
        title: 'Effective Java 3/e',
        subtitle:
            'Java 7, 8, 9 enhanced. Stream API, Lambda and Functional Programming and Optional class etc...',
        description: '자바 6 출시 직후 출간된 『이펙티브 자바 2판』 이후로 자바는 커다란 변화를 겪었다. '
            '그래서 졸트상에 빛나는 이 책도 자바 언어와 라이브러리의 최신 기능을 십분 활용하도록 내용 전반을 '
            '철저히 다시 썼다. 모던 자바가 여러 패러다임을 지원하기 시작하면서 자바 개발자들에게는 구체적인'
            '모범 사례가 더욱 절실해졌고, 관련 조언을 이 책에 담아낸 것이다.',
        image:
            'https://bookthumb-phinf.pstatic.net/cover/140/975/14097515.jpg?udate=20181023'),
    Book(
        title: '실전 파이썬 핸즈온 프로젝트',
        subtitle:
            'Java 7, 8, 9 enhanced. Stream API, Lambda and Functional Programming and Optional class etc...',
        description: '자바 6 출시 직후 출간된 『이펙티브 자바 2판』 이후로 자바는 커다란 변화를 겪었다. '
            '그래서 졸트상에 빛나는 이 책도 자바 언어와 라이브러리의 최신 기능을 십분 활용하도록 내용 전반을 '
            '철저히 다시 썼다. 모던 자바가 여러 패러다임을 지원하기 시작하면서 자바 개발자들에게는 구체적인'
            '모범 사례가 더욱 절실해졌고, 관련 조언을 이 책에 담아낸 것이다.',
        image:
            'https://bookthumb-phinf.pstatic.net/cover/224/862/22486246.jpg?udate=20220525'),
    Book(
        title: '구글 엔지니어는 이렇게 일한다.',
        subtitle:
            'Java 7, 8, 9 enhanced. Stream API, Lambda and Functional Programming and Optional class etc...',
        description: '자바 6 출시 직후 출간된 『이펙티브 자바 2판』 이후로 자바는 커다란 변화를 겪었다. '
            '그래서 졸트상에 빛나는 이 책도 자바 언어와 라이브러리의 최신 기능을 십분 활용하도록 내용 전반을 '
            '철저히 다시 썼다. 모던 자바가 여러 패러다임을 지원하기 시작하면서 자바 개발자들에게는 구체적인'
            '모범 사례가 더욱 절실해졌고, 관련 조언을 이 책에 담아낸 것이다.',
        image:
            'https://bookthumb-phinf.pstatic.net/cover/224/479/22447905.jpg?udate=20220519')
  ];

  List<Book> getAllBooks() {
    return _dummyBooks;
  }
}
