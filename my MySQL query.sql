WITH get_mail AS (
  -- Adds the owner email
  SELECT
    c.id,
    c.name,
    string_agg(email, ',') AS mails
  FROM
    marwan_777.companies AS c
    LEFT JOIN marwan_777.companies_members ON (
      c.id = marwan_777.companies_members.company_id
    )
    AND marwan_777.companies_members.is_owner = TRUE
  GROUP BY
    c.id,
    c.name
  ORDER BY
    c.id
),
Visits_withCompID_lookup AS (
  -- lookup for company ID  for each visit
  SELECT
    mv.visit_id AS "visit_id",
    cm.company_id AS "comp_id",
    cm.member_id AS "member_id",
    cm.name AS "name",
    mv.created_at AS "date"
  FROM
    marwan_777.companies_members AS cm
    INNER JOIN marwan_777.members_visits mv ON cm.member_id = mv.member_id
),
calc_lastmonth_visits AS (
  SELECT
    comp_id,
    count(member_id) AS "last_month_visits"
  FROM
    Visits_withCompID_lookup
  WHERE
    date("date") >= current_date - INTERVAL '30' DAY
    AND date("date") <= current_date
  GROUP BY
    comp_id
  ORDER BY
    comp_id
),
calc_lastThreeMonth_avg_visits AS (
  SELECT
    comp_id,
    (count("member_id")) :: decimal / 3.0 AS "avg"
  FROM
    Visits_withCompID_lookup
  WHERE
    date("date") >= current_date - INTERVAL '3 months'
    AND date("date") <= current_date
  GROUP BY
    comp_id
  ORDER BY
    comp_id
),
setting_alltogether AS (
  SELECT
    g.id,
    g.name,
    g.mails,
    COALESCE(lv.last_month_visits,0)  as Last_month_visits,
    COALESCE(av.avg,0),
    CASE
      when av.avg is null 
      then null
      WHEN (1 - COALESCE(lv.last_month_visits,0) :: decimal / COALESCE(av.avg,1)) * 100 >= 0 
      THEN (1 - COALESCE(lv.last_month_visits,0) :: decimal / COALESCE(av.avg,1)) * 100
      ELSE 0
    END AS Percentage_of_drop
  FROM
    get_mail AS g
    LEFT JOIN calc_lastmonth_visits AS lv ON g.id = lv.comp_id
    LEFT JOIN calc_lastThreeMonth_avg_visits AS av ON g.id = av.comp_id
),
add_churn AS (
  SELECT
    *,
    CASE
      when Percentage_of_drop is null then 'No Members !!'
      WHEN Percentage_of_drop > 50 THEN 'Yes'
      ELSE 'No'
    END AS "Likely to churn"
  FROM
    setting_alltogether
)
SELECT
  *
FROM
  add_churn
