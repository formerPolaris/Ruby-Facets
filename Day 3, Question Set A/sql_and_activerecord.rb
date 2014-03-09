# Prompt

# (from InstaCart) Write the following queries in SQL and in Rails:

#     "count all users",
#     "count all active users (you define what active means)",
#     "count all users who visited the site within a certain time period".

# Polaris's solution

# This will be written as if everything was done in ActiveRecord, or I were to
# make direct SQL queries from Ruby.

def count_all_users_AR
  User.all.length
end

def count_all_users_SQL
  SELECT
    COUNT(id)
  FROM
    users

end

def count_all_active_users_AR
  User.where(":now - user.last_online < 777600", :now => Time.now)
end

def count_all_active_users_SQL
  # Online in the past 3 days
  SQL, Time.now ->> SELECT
    COUNT(id)
  FROM
    users
  WHERE
    ? - user.last_online < 777600
end

def count_all_tracked_users_AR(stop1, stop2)
  User.where("user.last_online > :stop1 AND user.last_online < :stop2", :stop1 => stop1, :stop2 => stop2)
end

def count_all_tracked_users_SQL(stop1, stop2)
  SQL, :stop1 => stop1, :stop2 => stop2, ->>
end