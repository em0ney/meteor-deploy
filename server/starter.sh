# Source our properties
source common.conf
source props.conf

# unpack the bundle
echo "=========================="
echo "Unpacking $APPNAME.tgz"
echo "=========================="
tar -xvzf "$APPNAME.tgz"

# discard tar.gz file
echo "=========================="
echo "Deleting $APPNAME.tgz"
echo "=========================="
rm "$APPNAME.tgz"

# rebuild native packages
echo "=========================="
echo "Rebuilding fibers"
echo "=========================="
pushd bundle/server/node_modules
rm -r fibers
npm install fibers@1.0.0
popd

# setup environment variables
echo "=========================="
echo "Export env variables"
echo "=========================="
export MONGO_URL="mongodb://$MONGO_HOST:$MONGO_PORT/$APPNAME"
export ROOT_URL="http://$APP_DOMAIN"
export PORT=$NODE_APP_PORT

# start the server
echo "=========================="
echo "Start app!"
echo "=========================="
nohup node bundle/main.js &
