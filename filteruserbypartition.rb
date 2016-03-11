require "csv"

inputfile = "/Users/michaeltodd/ucm_csv_mod/userexport.csv"
outputfile = "BOCA-USERS.csv"

original = CSV.read(inputfile, { headers: true, return_headers: true })

CSV.open(outputfile, 'w') do |csv|
	csv << original.first
	original.each do |row|
		if row[' PRIMARY EXTENSION'].to_s.include? "BOCA"
			csv << row
		end
	end
end