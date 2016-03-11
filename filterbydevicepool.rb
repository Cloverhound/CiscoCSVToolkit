require "csv"

inputfile = "forimport.csv"
outputfile = "BOCA-PHONES.csv"
devicepool = "DP-BOCA"

original = CSV.read(inputfile, { headers: true, return_headers: true })

CSV.open(outputfile, 'w') do |csv|
	csv << original.first
	original.each do |row|
		if row['Device Pool'] == devicepool
			csv << row
		end
	end
end