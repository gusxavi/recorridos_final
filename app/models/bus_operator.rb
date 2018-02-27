class BusOperator
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :average_rating, type: Float, default: 0
  field :description, type: String
  field :qualifications, type: Array
  field :qualification, type: Integer
  field :qualification_comment, type: String
end
