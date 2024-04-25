class Quote extends Object {
  Quote(
      this.id,
      this.content,
      this.author,
      );
  final String id;
  final String? content;
  final String? author;
  double rate = 0;
}