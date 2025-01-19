```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      //Safe way to access the key
      final value = jsonResponse['nonExistentKey'] ?? 'default value'; 
      print(value); //Prints default value if key is missing

      //Alternative using containsKey
      if(jsonResponse.containsKey('anotherKey')){
        final anotherValue = jsonResponse['anotherKey'];
        print(anotherValue);
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    //Handle error appropriately
  }
}
```