set -e
cd "$(dirname "$0")"
cat | java -classpath ./lib/antlr-4.9.1-complete.jar:./bin Main codegen
