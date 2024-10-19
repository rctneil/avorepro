class WasteTimeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info("WasteTimeJob started.")
    sleep 60
    Rails.logger.info("WasteTimeJob finished.")
  end
end
