class Pizza
  include Mongoid::Document
  field :name, type: String
  belongs_to :doe_kind
  has_and_belongs_to_many :toppings, inverse_of: nil
  embeds_many :images
end
