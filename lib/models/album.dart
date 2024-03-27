import 'package:genius_lyrics/models/models.dart';
import 'package:genius_lyrics/src/utils.dart';

class Album {
  Map<String, dynamic> _albumInfo = {};
  Artist? _artist;
  List<Song> _tracks = [];
  String? _apiPath;
  int? _id;
  String? _url;
  String? _name;
  String? _fullTitle;
  String? _coverAartThumbnailrl;
  String? _coverArtUrl;

  Album({required Map<String, dynamic> albumInfo, required List<Song> tracks}) {
    _albumInfo = albumInfo;
    _artist = Artist(artistInfo: albumInfo['artist']);
    _tracks = tracks;
    _url = albumInfo['url'];
    _id = albumInfo['id'];
    _name = albumInfo['name'];
    _fullTitle = albumInfo['full_title'];
    _coverArtUrl = albumInfo['cover_art_url'];
    _coverAartThumbnailrl = albumInfo['cover_art_thumbnail_url'];
  }

  /// returns song data and this data have some fields that are not present in the [Album]
  Map<String, dynamic> get toJson => _albumInfo;

  Artist? get artist => _artist;

  List<Song> get tracks => _tracks;

  String? get apiPath => _apiPath;

  String? get fullTitle => _fullTitle;

  String? get coverAartThumbnailrl => _coverAartThumbnailrl;

  String? get coverArtUrl => _coverArtUrl;

  String? get url => _url;

  int? get id => _id;

  String? get name => _name;

  /// Save the lyrics of all the tracks of the album
  ///
  ///Given the `destPath` (destination path), each track lyrics will be saved in that location with the track title as the filename
  ///
  ///`destPath` must have '/' as separator
  Future<void> saveLyrics(
      {required String destPath,
      String ext = '.lrc',
      bool overwite = true,
      bool verbose = true}) async {
    saveLyricsOfMultipleSongs(
        songs: tracks,
        destPath: destPath,
        ext: ext,
        overwite: overwite,
        verbose: verbose);
  }
}
