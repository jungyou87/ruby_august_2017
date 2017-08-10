class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, presence: true
    validates :state, length: { maximum: 2 }
    has_many :students, dependent: :destroy
end
