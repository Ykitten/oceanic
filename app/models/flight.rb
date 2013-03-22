# == Schema Information
#
# Table name: flights
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  destination :string(255)
#  origin      :string(255)
#  date        :date
#  plane_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Flight < ActiveRecord::Base
  attr_accessible :name, :destination, :origin, :date, :plane_id
  has_many :seats
  belongs_to :plane
end
