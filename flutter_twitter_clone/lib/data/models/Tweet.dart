class Tweet {
  final String userName;
  final String userHandle;
  final String profileImageUrl;
  final String tweetText;
  final DateTime timestamp;

  Tweet({
    required this.userName,
    required this.userHandle,
    required this.profileImageUrl,
    required this.tweetText,
    required this.timestamp,
  });
}
