namespace :slurp do
  desc "TODO"
  task students: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "student.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Student.new
      t.id = row["id"]
      t.email = row["email"]
      t.grade = row["grade"]
      t.state = row["state"]
      t.name = row["name"]
      t.save
      puts "#{t.name} saved"
    end

    puts "There are now #{Student.count} rows in the transactions table"
  end

end
