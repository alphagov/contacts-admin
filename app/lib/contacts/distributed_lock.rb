require "redis"
require "redis-lock"

module Contacts
  class DistributedLock
    LIFETIME = (5 * 60) # seconds. The lock expires automatically after this time

    def initialize(lock_name)
      @lock_name = lock_name
    end

    def lock
      Redis.current.lock("contacts-admin:#{Rails.env}:#{@lock_name}", life: LIFETIME) do
        Rails.logger.debug("Successfully got a lock. Running...")
        yield
      end
    rescue Redis::Lock::LockNotAcquired => e
      Rails.logger.debug("Failed to get lock for #{@lock_name} (#{e.message}). Another process probably got there first.")
    end
  end
end
