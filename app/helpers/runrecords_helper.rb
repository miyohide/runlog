module RunrecordsHelper
  def distance_per_month_table(user)
    rval = "<table><tbody>"
    Runrecord.distance_summary_per_month(user).each do |distances|
      rval += "<tr><td>#{distances[:date]}</td><td>#{"%.2f" % distances[:total_distance]}</td></tr>"
    end
    rval += "</tbody></table>"

    rval.html_safe
  end
end
