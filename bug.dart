```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming JSON response
      final jsonResponse = json.decode(response.body);
      // Accessing a non-existent key
      final value = jsonResponse['nonExistentKey']; 
      print(value); //This will throw an error if 'nonExistentKey' is not found
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    //Handle error appropriately
  }
}
```