# First need to set up a connection called rai-trial with
#   snow connection add

# pass filename of sql to run as first argument
snow sql -c rai-trial -f setup-schema.sql

# set up stage
snow stage create -c rai-trial --database rai_getting_started --schema power_transmission_network gettingstartedcsvs

# load csvs into stage
snow stage copy -c rai-trial --database rai_getting_started --schema power_transmission_network ../csv @gettingstartedcsvs

snow sql -c rai-trial --database rai_getting_started --schema power_transmission_network -f setup-data.sql;
