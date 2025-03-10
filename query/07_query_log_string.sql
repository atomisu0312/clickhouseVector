WITH hassubstr AS (
    SELECT
        row_number() OVER (ORDER BY query_start_time DESC) AS row_number,
        'hasSubstr' AS type,
        query_start_time,
        query_duration_ms
    FROM
        system.query_log
    WHERE
        query LIKE '%hasSubstr%'
        AND query NOT LIKE '%system.query_log%'
    ORDER BY
        query_start_time DESC
    LIMIT 4
),
liketable AS (
    SELECT
        row_number() OVER (ORDER BY query_start_time DESC) AS row_number,
        'liketable' AS type,
        query_start_time,
        query_duration_ms
    FROM
        system.query_log
    WHERE
        query LIKE '%LIKE%'
        AND query NOT LIKE '%system.query_log%'
    ORDER BY
        query_start_time DESC
    LIMIT 4
)

SELECT
    hassubstr.row_number,
    hassubstr.query_start_time,
    hassubstr.query_duration_ms,
    liketable.query_start_time,
    liketable.query_duration_ms
FROM
    hassubstr
JOIN
    liketable
ON
    hassubstr.row_number = liketable.row_number
ORDER BY
    hassubstr.row_number
LIMIT 4