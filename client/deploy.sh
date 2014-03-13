# Source our properties
source common.conf
source props.conf

# Ok, lets do this.
# first bundle
echo "=========================="
echo "Bundling $APPNAME.tgz"
echo "=========================="
mrt bundle "$APPNAME.tgz"
# now SCP to remote host
echo "=========================="
echo "Copying $APPNAME.tgz to $APP_ROOT_DIR on $HOST"
echo "=========================="
scp -P $SSH_PORT "$APPNAME.tgz" "$USER@$HOST:$APP_ROOT_DIR"
# now run server side script to stop, unpack and launch
echo "=========================="
echo "Starting launch script on remote host $HOST"
echo "=========================="
ssh -p $SSH_PORT "$USER@$HOST" -C "cd $APP_ROOT_DIR; ./starter.sh"

exit 0
