delete from insight.discount;

COPY insight.discount
FROM 's3://demo.evoqu.com/misc/jon.csv' CREDENTIALS 'aws_access_key_id=AKIAIV732XRJB43M3RVQ;aws_secret_access_key=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' delimiter ',' CSV ACCEPTINVCHARS;


