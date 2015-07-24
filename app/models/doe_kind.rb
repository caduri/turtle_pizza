class DoeKind
  include Mongoid::Document
  field :name, type: String
  has_one :pizza
end
