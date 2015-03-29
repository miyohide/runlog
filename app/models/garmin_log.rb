class GarminLog < ActiveRecord::Base
  tori :csv_file

  after_save do
    csv_file.write if csv_file.from?
  end

  after_destroy do
    csv_file.delete
  end
end

