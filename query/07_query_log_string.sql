SELECT
    query_start_time,
    query_duration_ms,
    query
FROM
    system.query_log
WHERE
    query LIKE '%サッカー%'
ORDER BY
    query_start_time DESC
LIMIT 4;
