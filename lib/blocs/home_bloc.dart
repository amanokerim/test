import 'package:amanokerim/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<String, List<Post>> {
  List<Post> _posts = [
    Post("Green",
        "Green is the color between blue and yellow on the visible spectrum. It is evoked by light which has a dominant wavelength of roughly 495–570 nm."),
    Post("Blue",
        "Blue is one of the three primary colours of pigments in painting and traditional colour theory, as well as in the RGB colour model."),
    Post("Yellow",
        "Yellow is the color between orange and green on the spectrum of visible light. It is evoked by light with a dominant wavelength of roughly 570–590 nm."),
    Post("Red",
        "Red is the color at the end of the visible spectrum of light, next to orange and opposite violet. It has a dominant wavelength of approximately 625–740 nanometres."),
  ];

  List<Post> _filteredPosts;

  HomeBloc(List<Post> initialState) : super(initialState);

  @override
  Stream<List<Post>> mapEventToState(String pattern) async* {
    if (pattern.isEmpty)
      _filteredPosts = _posts;
    else
      _filteredPosts = _posts
          .where(
            (post) => post.title.toLowerCase().contains(pattern.toLowerCase()),
          )
          .toList();
    yield _filteredPosts;
  }
}
