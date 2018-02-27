require 'net/http'
require 'json'

class RecorridoService

  def initialize
    @url = 'https://www.recorrido.cl/api/v2/es/bus_operators.json'
  end

  def call
    get_bus_operators
  end

  private  
    def get_bus_operators     
      uri = URI(@url)
      response = Net::HTTP.get(uri)
      update_operators JSON.parse(response)
    end

    def update_operators values            
      begin
        #Execute if number of Operators has changed
        if BusOperator.all.count != values["bus_operators"].length
          values["bus_operators"].each do |operator|      
            bo = BusOperator.find(operator["id"])
            if bo.nil?
              bo = BusOperator.new(operator)                            
              if operator["average_rating"]
                puts bo.to_yaml
                10.times { bo.qualifications.push({qualification_comment: nil, qualification: operator["average_rating"]}) }                 
              end
              bo.save
            end            
          end
        end  
      rescue Exception => e
        puts e
      end  
    end

end