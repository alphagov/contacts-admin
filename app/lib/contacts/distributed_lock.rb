require "redis"
require "redis-lock"

module Contacts
  class DistributedLock
    LIFETIME = (5 * 60) # seconds. The lock expires automatically after this time

    def lock
      Redis.current.lock("contacts-admin:organisations:import", life: LIFETIME) do
        Rails.logger.debug("Successfully got a lock. Running...")
        yield
      end
    rescue Redis::Lock::LockNotAcquired => e
      Rails.logger.debug("Failed to get lock for organisations:import (#{e.message}). Another process probably got there first.")
    end
  end
end
