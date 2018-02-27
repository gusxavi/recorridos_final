class UpdateOperatorsJob < ApplicationJob
  queue_as :recorridos

  def perform
    #Call Service to update JSON's provider
    RecorridoService.new.call
  end
end
