import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

leads = pd.read_csv("leads.csv", parse_dates=["created_date"])
events = pd.read_csv("lead_stage_events.csv", parse_dates=["stage_date"])

leads["cohort_month"] = leads["created_date"].dt.to_period("M").astype(str)

customer_events = events[events["stage"] == "Customer"][["lead_id", "stage_date", "revenue"]]
cohort = leads.merge(customer_events, on="lead_id", how="left")
cohort["is_customer"] = cohort["stage_date"].notna().astype(int)
cohort["months_to_customer"] = (
    (cohort["stage_date"].dt.to_period("M") - cohort["created_date"].dt.to_period("M"))
    .apply(lambda x: x.n if pd.notna(x) else np.nan)
)

cohort_summary = cohort.groupby("cohort_month").agg(
    leads=("lead_id", "nunique"),
    customers=("is_customer", "sum"),
    revenue=("revenue", "sum")
).reset_index()

cohort_summary["conversion_rate_pct"] = (cohort_summary["customers"] / cohort_summary["leads"] * 100).round(2)
print(cohort_summary)

channel_summary = cohort.groupby("channel").agg(
    leads=("lead_id", "nunique"),
    customers=("is_customer", "sum"),
    revenue=("revenue", "sum"),
    cost=("acquisition_cost", "sum"),
    avg_days_to_customer=("stage_date", lambda x: np.nan)
).reset_index()

days = cohort[cohort["is_customer"] == 1].copy()
days["days_to_customer"] = (days["stage_date"] - days["created_date"]).dt.days
avg_days = days.groupby("channel")["days_to_customer"].mean().reset_index()

channel_summary = channel_summary.drop(columns=["avg_days_to_customer"]).merge(avg_days, on="channel", how="left")
channel_summary["conversion_rate_pct"] = (channel_summary["customers"] / channel_summary["leads"] * 100).round(2)
channel_summary["cac"] = (channel_summary["cost"] / channel_summary["customers"].replace(0, np.nan)).round(2)
print(channel_summary.sort_values("conversion_rate_pct", ascending=False))

matrix = cohort[cohort["is_customer"] == 1].pivot_table(
    index="cohort_month",
    columns="months_to_customer",
    values="lead_id",
    aggfunc="nunique",
    fill_value=0
)
print(matrix)

cohort_summary.plot(x="cohort_month", y=["leads", "customers"], kind="line", marker="o")
plt.title("Leads and Customers by Cohort Month")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()