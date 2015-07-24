class Order
  include Mongoid::Document
  belongs_to :pizza
  belongs_to :doe_kind
  has_and_belongs_to_many :toppings, inverse_of: nil
end
