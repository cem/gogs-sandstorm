rootPath=$PWD
outPath=gogs
srcPath=build/src/github.com/gogits/gogs

rm -rf $outPath
mkdir $outPath

GOPATH="$rootPath/build" go build -o "$outPath/gogs" -tags "sqlite" "$srcPath/gogs.go"

cp -r $srcPath/conf/ $outPath/conf/
cp -r $srcPath/public/ $outPath/public/
cp -r $srcPath/templates/ $outPath/templates/
#cp cert.pem $outPath/
#cp gogs_supervisord.sh $outPath/
#cp ../key.pem $outPath/
cp -r $srcPath/LICENSE $outPath/
