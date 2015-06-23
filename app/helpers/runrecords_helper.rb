module RunrecordsHelper
  def distance_per_month_table(user)
    # create thead area.
    thead = content_tag :thead do
      content_tag :tr do
        concat content_tag(:th, "日付")
        concat content_tag(:th, "距離")
      end
    end

    # create tbody area.
    tbody = content_tag :tbody do
      Runrecord.distance_summary_per_month(user).map {|distances|
        content_tag :tr do
          concat content_tag(:td, distances[:date])
          concat content_tag(:td, "%.2f" % distances[:total_distance])
        end
      }.join().html_safe
    end

    content_tag :table, thead.concat(tbody)
  end
end
