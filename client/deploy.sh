# Source our properties
source common.conf
source props.conf

# Ok, lets do this.
# first bundle
mrt bundle "$APPNAME.tgz"
# now SCP to remote host
scp -P $SSH_PORT *.tgz $USER@$HOST:$APP_ROOT_DIR
# now run server side script to stop, unpack and launch
ssh -p $SSH_PORT $USER@$HOST:$APP_ROOT_DIR -C "./starter.sh"

exit 0
