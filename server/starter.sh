# Source our properties
source common.conf
source props.conf

# unpack the bundle
tar -xvzf "$APPNAME.tar.gz"

# discard tar.gz file
rm "$APPNAME.tar.gz"

# rebuild native packages
pushd bundle/server/node_modules
rm -r fibers
npm install fibers@1.0.0
popd

# setup environment variables
export MONGO_URL="mongodb://$MONGO_HOST:$MONGO_PORT/$APPNAME"
export ROOT_URL="http://$APP_DOMAIN"
export PORT=$NODE_APP_PORT

# start the server
nohup node bundle/main.js &
