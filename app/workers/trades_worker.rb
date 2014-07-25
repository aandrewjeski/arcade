'require btce'

class TradesWorker
  include Sidekiq::Worker

  def perform(price)

  end
end
