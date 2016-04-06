module PrototypesHelper
  def posted_date(prototype)
    prototype.created_at.strftime('%b %d %a')
  end
end
