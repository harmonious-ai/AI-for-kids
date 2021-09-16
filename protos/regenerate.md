# Generate protobuf files in Dart
1. If upgrading, delete all proto files from /home/.pub-cache/bin
1. Clone the latest dart-protoc-plugin from https://github.com/dart-lang/protobuf
1. Run `pub install` inside protobuf/protoc_plugin
1. Run `pub global activate protoc_plugin` to get .dart files into /home/.pub-cache/bin/
1. Get the latest linux protoc compiler from https://github.com/google/protobuf/releases/ (protoc-X.X.X-linux-x86_64.zip)
1. Copy /bin/protoc into /home/.pub-cache/bin/
1. Run the following commands from this project's protos folder

    ```protoc --dart_out=../lib/gen ./landmark.proto```
    
    ```protoc --objc_out=../ios/gen ./landmark.proto```


## Mac
```
protoc --dart_out=../lib/gen --plugin=protoc-gen-dart=$HOME/.pub-cache/bin/protoc-gen-dart ./landmark.proto
```