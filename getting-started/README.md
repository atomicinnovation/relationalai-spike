# RelationalAI - Getting Started

This follows the RelationalAI ['Getting Started'](https://relational.ai/docs/getting_started) docs

-----
## Setting up the data in Snowflake

Run the following script: 

        $ ./scripts/setup-data.sh

The following environment variables are required to run the script: 

`SNOWFLAKE_ACCOUNT` - What this value should be isn't super obvious, the easiest is to get it 
from the URL of your snowflake homepage which has the 
format **app.snowflake.com/`<ORG_ID>`/`<ACCOUNT_ID>`/#/homepage**.  
In the CLI set the account name as `<ORG_ID>`-`<ACCOUNT_ID>` (case isn't important) 

`SNOWFLAKE_USER` - This is the username you use to log in to the snowflake console.

`SNOWFLAKE_PASSWORD` - This is the password you use to log in to snowflake console.

This script will create a database and schema in your snowflake account for the 'Getting Started' example,
and load the data from `nodes.csv` and `powerlines.csv` into tables in that schema.

-----
