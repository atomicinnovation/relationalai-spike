#!/bin/bash
set -e

if [[ -z "$SNOWFLAKE_ACCOUNT" ]]; then
  echo "ERROR: Must provide SNOWFLAKE_ACCOUNT." 1>&2
  exit 1
fi

if [[ -z "$SNOWFLAKE_USER" ]]; then
  echo "ERROR: Must provide SNOWFLAKE_USER." 1>&2
  exit 1
fi

if [[ -z "$SNOWFLAKE_PASSWORD" ]]; then
  echo "ERROR: Must provide SNOWFLAKE_PASSWORD." 1>&2
  exit 1
fi

SCRIPT_DIR=$(dirname "$(realpath "$0")")

#SNOWFLAKE_CONNECTION_NAME=rai_getting_started
#
#export SNOWFLAKE_ACCOUNT=$SNOWFLAKE_ACCOUNT_NAME
#export SNOWFLAKE_USER=$SNOWFLAKE_USERNAME
#export SNOWFLAKE_PASSWORD=$SNOWFLAKE_PASSWORD

#snow connection add \
#--connection-name $SNOWFLAKE_CONNECTION_NAME \
#--account "$SNOWFLAKE_ACCOUNT_NAME" \
#--username "$SNOWFLAKE_USERNAME" \
#--password "$SNOWFLAKE_PASSWORD"

# run sql to setup create database called rai_getting_started and schema called power_transmission_network
snow sql \
-f "$SCRIPT_DIR/setup-schema.sql" \
--temporary-connection


# set up stage called gettingstartedcsvs
snow stage create gettingstartedcsvs \
--database rai_getting_started \
--schema power_transmission_network \
--temporary-connection

# load csvs into stage
snow stage copy "$SCRIPT_DIR/../csv" @gettingstartedcsvs \
--database rai_getting_started \
--schema power_transmission_network \
--temporary-connection

# load data from csvs into SQL tables
snow sql -f "$SCRIPT_DIR/setup-data.sql" \
--database rai_getting_started \
--schema power_transmission_network \
--temporary-connection
