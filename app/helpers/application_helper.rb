module ApplicationHelper
  def most_recent_tool
    return if session[:most_recent_tool_id].nil?
    Tool.find(session[:most_recent_tool_id].to_i)
  end
end
