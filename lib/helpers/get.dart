class Get {
  Get._();
  static Get i = Get._();

  Map<String, dynamic> _data = Map();

 
  void put<T>(dynamic dependency) {
   
    _data[T.toString()] = dependency;
  }

  T find<T>() {
    
    String key = T.toString();

    if (!_data.containsKey(key)) {
      throw AssertionError("$key not found, make sure call put first");
    }
    return _data[key];
  }

  void remove<T>({String? key}) {
    
    _data.remove(key);
  }
}
