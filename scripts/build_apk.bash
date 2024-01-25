set -euo pipefail

OUTPUT_PATH=build/app/outputs/flutter-apk/release
flutter build apk --split-per-abi

case "$(uname -sr)" in
   Darwin*)
    # echo 'Mac OS X'
    cd $OUTPUT_PATH
    open .
    cd ~-
    ;;

   Linux*Microsoft*)
    # echo 'WSL'
    ;;

   Linux*)
    # echo 'Linux'
    ;;

   CYGWIN*|MINGW*|MINGW32*|MSYS*)
    # echo 'MS Windows'
    cd $OUTPUT_PATH
    start .
    cd ~-
    ;;

   *)
    # echo 'Other OS' 
    ;;
esac
