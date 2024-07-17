CREATE TABLE IF NOT EXISTS nodes (
    id INT PRIMARY KEY,
    type TEXT,
    description TEXT,
    status TEXT
);

CREATE TABLE IF NOT EXISTS powerlines (
    source_node_id INT NOT NULL,
    target_node_id INT NOT NULL
);

COPY INTO nodes
    FROM @gettingstartedcsvs/nodes.csv
    FILE_FORMAT = (TYPE='CSV' PARSE_HEADER=TRUE)
    MATCH_BY_COLUMN_NAME='CASE_INSENSITIVE';

COPY INTO powerlines
    FROM @gettingstartedcsvs/powerlines.csv
    FILE_FORMAT = (TYPE='CSV' PARSE_HEADER=TRUE)
    MATCH_BY_COLUMN_NAME='CASE_INSENSITIVE';
