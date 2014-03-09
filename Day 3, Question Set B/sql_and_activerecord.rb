# Prompt

# (from InstaCart) Write the following queries in SQL and in Rails:

#     "count all users",
#     "count all active users (you define what active means)",
#     "count all users who visited the site within a certain time period".

# Polaris's solution

# This will be written as if everything was done in ActiveRecord, or I were to
# make direct SQL queries from Ruby.

require 'SQLite3'

class UserDatabase < SQLite3::Database
end

def count_all_users_AR
  User.all.length
end

def count_all_users_SQL
  UserDatabase.instance.execute(<<-SQL
    SELECT
      COUNT(id)
    FROM
      users
  SQL
end

def count_all_active_users_AR
  # Online in the past 3 days
  User.where(":now - user.last_online < 777600", :now => Time.now)
end

def count_all_active_users_SQL
  UserDatabase.instance.execute(<<-SQL, :now => Time.now
    SELECT
      COUNT(id)
    FROM
      users
    WHERE
      :now - user.last_online < 777600
  SQL
end

def count_all_tracked_users_AR(stop1, stop2)
  User.where("user.last_online > :stop1 AND user.last_online < :stop2", :stop1 => stop1, :stop2 => stop2)
end

def count_all_tracked_users_SQL(stop1, stop2)
  UserDatabase.instance.execute(<<-SQL, :stop1 => stop1, :stop2 => stop2,
    SELECT
      COUNT(id)
    FROM
      users
    WHERE
      user.last_online > :stop1 AND user.last_online < :stop2
  SQL
end