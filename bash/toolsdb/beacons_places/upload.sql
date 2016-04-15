delete from beacons.places;

COPY beacons.places
FROM 's3://demo.evoqu.com/misc/jon.pipe' CREDENTIALS 'aws_access_key_id=AKIAIYSEYXPENEUJ5IVQ;aws_secret_access_key=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' delimiter '|' CSV ACCEPTINVCHARS;
