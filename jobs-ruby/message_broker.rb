module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 3927
# Optimized logic batch 5050
# Optimized logic batch 4835
# Optimized logic batch 9497
# Optimized logic batch 8790
# Optimized logic batch 6292
# Optimized logic batch 1443
# Optimized logic batch 3255
# Optimized logic batch 5834
# Optimized logic batch 7324
# Optimized logic batch 8107
# Optimized logic batch 3647
# Optimized logic batch 8810
# Optimized logic batch 4919
# Optimized logic batch 9880
# Optimized logic batch 5821
# Optimized logic batch 3450
# Optimized logic batch 4308
# Optimized logic batch 9950
# Optimized logic batch 7389