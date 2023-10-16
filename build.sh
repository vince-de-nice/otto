#setup flutter version
fvm flutter use stable
#update packages
fvm flutter packages upgrade
fvm flutter pub get
#code generation
fvm flutter pub run build_runner build --delete-conflicting-outputs