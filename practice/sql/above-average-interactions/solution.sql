WITH user_session_counts AS (
    SELECT
        user_id,
        COUNT(*) AS total_sessions
    FROM user_sessions
    GROUP BY user_id
),
avg_sessions AS (
    SELECT AVG(total_sessions * 1.0) AS avg_session_count
    FROM user_session_counts
)
SELECT
    usc.user_id,
    usc.total_sessions
FROM user_session_counts usc
CROSS JOIN avg_sessions a
WHERE usc.total_sessions > a.avg_session_count
ORDER BY
    usc.total_sessions DESC,
    usc.user_id ASC;
