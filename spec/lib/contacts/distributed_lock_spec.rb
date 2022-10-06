require "rails_helper"
require "redis"
require "redis-lock"

RSpec.describe "Contacts::DistributedLock" do
  describe "#lock" do
    it "yields the block when a redis lock can be acquired" do
      expect_any_instance_of(Redis).to receive(:lock).and_call_original
      expect { |b| Contacts::DistributedLock.new.lock(&b) }.to yield_control
    end

    it "silently doesn't a yield the block when a lock can't be acquired" do
      allow_any_instance_of(Redis).to receive(:lock).and_raise(Redis::Lock::LockNotAcquired)
      expect { |b| Contacts::DistributedLock.new.lock(&b) }.not_to yield_control
    end
  end
end
