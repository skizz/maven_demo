DIR=`dirname $0`

mvn -s $DIR/local_settings.xml -Dmaven.repo.local=$DIR/local_repo -e -B $*


