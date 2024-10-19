class Avo::ToolsController < Avo::ApplicationController

  def waste_time
      WasteTimeJob.perform_later
      redirect_to gallery_tools_path
  end
end