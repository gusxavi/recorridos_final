class BusOperator
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  field :average_rating, type: Float, default: 0
  field :description, type: String
  field :qualifications, type: Array, default: []
  field :qualification, type: Integer
  field :qualification_comment, type: String 
  
  def set_average_rating
      _average = 0    
      self.qualifications.each do |qualif|
        _average = _average + qualif[:qualification].to_f
      end      
      self.average_rating = (_average.to_f / self.qualifications.size).round(2)
  end
end
