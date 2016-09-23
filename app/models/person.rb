# == Schema Information
#
# Table name: people
#
#  id             :integer          not null, primary key
#  age            :string
#  income         :string
#  marital_status :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Person < ApplicationRecord
end
