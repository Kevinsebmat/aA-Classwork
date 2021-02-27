# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'
class Cat < ApplicationRecord
    ActionView::Helpers::DateHelper
    
    COLOR = %w(black white brown red rainbow)
    validates :color, inclusion: COLOR, presence: true
    validates :name, :birth_date, presence: true
    validates :sex, inclusion: %w(F M), presence: true
    

    def age
        # kitty = Cat.new(birth_date:)
        kitty.birth_date
    end
end
