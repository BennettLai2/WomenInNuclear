class Event < ApplicationRecord

  validates_datetime :start_time, on: :create, on_or_after: :today
  validates_datetime :end_time, after: :start_time
end
