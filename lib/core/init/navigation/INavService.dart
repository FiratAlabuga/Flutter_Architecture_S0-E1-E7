abstract class INavService{
  Future<void> navToPage({String path,Object data});
  Future<void> navToPageClear({String path,Object data});
}