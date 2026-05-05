-- Cohort Funnel Analytics SQL Starter Pack

-- 1. Cohort size by acquisition month
SELECT
  FORMAT_DATE('%Y-%m', created_date) AS cohort_month,
  COUNT(DISTINCT lead_id) AS cohort_leads
FROM `your_dataset.leads`
GROUP BY cohort_month
ORDER BY cohort_month;

-- 2. Stage counts by cohort month
SELECT
  FORMAT_DATE('%Y-%m', l.created_date) AS cohort_month,
  e.stage,
  COUNT(DISTINCT e.lead_id) AS leads
FROM `your_dataset.leads` l
JOIN `your_dataset.lead_stage_events` e
  ON l.lead_id = e.lead_id
GROUP BY cohort_month, e.stage
ORDER BY cohort_month, e.stage;

-- 3. True customer conversion by cohort
SELECT
  FORMAT_DATE('%Y-%m', l.created_date) AS cohort_month,
  COUNT(DISTINCT l.lead_id) AS total_leads,
  COUNT(DISTINCT CASE WHEN e.stage = 'Customer' THEN e.lead_id END) AS customers,
  ROUND(
    COUNT(DISTINCT CASE WHEN e.stage = 'Customer' THEN e.lead_id END) * 100.0 /
    COUNT(DISTINCT l.lead_id), 2
  ) AS customer_conversion_rate_pct
FROM `your_dataset.leads` l
LEFT JOIN `your_dataset.lead_stage_events` e
  ON l.lead_id = e.lead_id
GROUP BY cohort_month
ORDER BY cohort_month;

-- 4. Average days to customer by channel
SELECT
  l.channel,
  ROUND(AVG(DATE_DIFF(e.stage_date, l.created_date, DAY)), 1) AS avg_days_to_customer
FROM `your_dataset.leads` l
JOIN `your_dataset.lead_stage_events` e
  ON l.lead_id = e.lead_id
WHERE e.stage = 'Customer'
GROUP BY l.channel
ORDER BY avg_days_to_customer;

-- 5. Channel performance with CAC and revenue
SELECT
  l.channel,
  COUNT(DISTINCT l.lead_id) AS total_leads,
  COUNT(DISTINCT CASE WHEN e.stage = 'Customer' THEN e.lead_id END) AS customers,
  ROUND(SUM(l.acquisition_cost), 2) AS total_cost,
  ROUND(SUM(CASE WHEN e.stage = 'Customer' THEN e.revenue ELSE 0 END), 2) AS revenue,
  ROUND(SUM(l.acquisition_cost) / NULLIF(COUNT(DISTINCT CASE WHEN e.stage = 'Customer' THEN e.lead_id END), 0), 2) AS cac
FROM `your_dataset.leads` l
LEFT JOIN `your_dataset.lead_stage_events` e
  ON l.lead_id = e.lead_id
GROUP BY l.channel
ORDER BY revenue DESC;

-- 6. Cohort matrix base: months from lead creation to customer conversion
SELECT
  FORMAT_DATE('%Y-%m', l.created_date) AS cohort_month,
  DATE_DIFF(DATE_TRUNC(e.stage_date, MONTH), DATE_TRUNC(l.created_date, MONTH), MONTH) AS months_since_cohort,
  COUNT(DISTINCT e.lead_id) AS customers
FROM `your_dataset.leads` l
JOIN `your_dataset.lead_stage_events` e
  ON l.lead_id = e.lead_id
WHERE e.stage = 'Customer'
GROUP BY cohort_month, months_since_cohort
ORDER BY cohort_month, months_since_cohort;
