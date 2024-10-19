class Avo::Actions::WasteTime < Avo::BaseAction
  self.name = "Waste Time"

  def handle(query:, fields:, current_user:, resource:, **args)
    query.each do |record|
        WasteTimeJob.perform_later(record)
    end
  end
end
