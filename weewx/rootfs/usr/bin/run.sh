#!/usr/bin/with-contenv bashio

# The weewx config will go in $CONFIG_DIR/weewx/
CONFIG_DIR=/data

# The weewx.sdb file will go in $DATABASE_DIR
DATABASE_DIR=/data

fetch_config() {
    export BUCKET=$(bashio::config 'config_bucket')
    export AWS_ACCESS_KEY_ID=$(bashio::config 'aws_access_key_id')
    export AWS_SECRET_ACCESS_KEY=$(bashio::config 'aws_secret_access_key')

    bashio::log.info "Fetching config from $BUCKET"

    mkdir /tmp/weewx/ &&
        aws s3 cp s3://$BUCKET/config/weewx/ /tmp/weewx/ --recursive &&
        rm -rf $CONFIG_DIR/weewx/
        mv /tmp/weewx $CONFIG_DIR/

    if [ -f $DATABASE_DIR/weewx.sdb ]; then
        bashio::log.info "Using the existing database..."
    else
        bashio::log.info "Downloading database snapshot..."
        aws s3 cp s3://$BUCKET/backup/weewx.sdb $DATABASE_DIR/
    fi
}

main() {
    cd /data
    ulimit -c unlimited

    fetch_config

    bashio::log.info "Starting weewxd..."
    /home/weewx/bin/weewxd /data/weewx/weewx.conf
}

main "$@"
