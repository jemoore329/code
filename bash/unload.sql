-- unload all profile data tables to S3
UNLOAD ('select * from signals.brand_score')
TO 's3://sa-analytics/profile/signals_brand_score'
WITH
CREDENTIALS AS 'aws_access_key_id=AKIAIYSEYXPENEUJ5IVQ;aws_secret_access_key=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'
 DELIMITER AS '|'
 GZIP
 ALLOWOVERWRITE
 PARALLEL OFF
 ;

