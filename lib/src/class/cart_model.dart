class CartModel {
  int _itemID;
  String _image;
  int _itemCount;

  CartModel(this._itemID, this._image, this._itemCount);

  get getItemID => _itemID;
  get getImage => _image;
  get getItemCount => _itemCount;

  set setItemID(int itemID) {
    _itemID = itemID;
  }

  set setImage(String image) {
    _image = image;
  }

  set setItemCount(int itemCount) {
    _itemCount = itemCount;
  }
}
