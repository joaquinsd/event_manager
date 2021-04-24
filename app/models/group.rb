class Group < ApplicationRecord
  has_many :concerts, dependent: :destroy
  enum group_type: %w[BoyBand GirlBand Solo Band]

  def concerts_amount
    concerts.count
  end

  def total_attendance
    Group.includes(:concerts).references(:concerts).where(concerts: { group_id: id }).sum(:attendance)
  end

  def concerts_this_month
    arr = concerts.map(&:date)
    arr.select{ |reg| reg.to_date >= Date.today.beginning_of_month && reg.to_date <= Date.today.end_of_month }.count
  end

  def last_concert
    concerts.maximum(:date)
  end

  def max_attendance
    concerts.maximum(:attendance)
  end

  def max_duration
    concerts.maximum(:duration)
  end


end

