class MyHashTable {
  int? size;
  List<List<MapEntry<String, dynamic>>> buckets = [];

  MyHashTable(int getSize) {
    size = getSize;
    buckets = List.generate(getSize, (index) => []);
  }

  hash(String key) {
    return key.length % size!;
  }
  
  insert(String key, dynamic data) {
    int index = hash(key);

    for (var values in buckets[index]) {
      if (values.key == key) {
        values = data;
        return;
      }
    }
    buckets[index].add(MapEntry(key, data));
  }

  find(String key) {
    int index = hash(key);

    for (var values in buckets[index]) {
      if (values.key == key) {
        return values.value;
      }
    }
  }

  remove(String key, dynamic data) {
    int index = hash(key);
    buckets[index].removeWhere((element) => element.key == key);
  }
}

void main() {
  MyHashTable hashTable = MyHashTable(5);

  // Insert values
  hashTable.insert("name", "jyo");
  hashTable.insert('age', '23');
  print(hashTable.buckets);
  print('${hashTable.find('age')}');
}
