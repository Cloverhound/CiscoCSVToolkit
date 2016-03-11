require "csv"

importfile = "phoneexport.csv"
exportfile = "forimport.csv"

original = CSV.read(importfile, { headers: true, return_headers: true })

headers = original.headers
badheaders = Array.new

headers.each do |x|
	if x.include? 'ASCII'
		badheaders << x
	end
	if x.include? 'Call Recording Profile'
		badheaders << x
	end
	if x.include? 'Calling Party Transformation CSS'
		badheaders << x
	end
	if x.include? 'Mobile Smart Client Profile'
		badheaders << x
	end
	if x.include? 'Mobility Identity Time of Day Access'
		badheaders << x
	end
	if x.include? 'Time of Day Access'
		badheaders << x
	end
	if x.include? 'Call Recording Option'
		badheaders << x
	end
	if x.include? 'BLF Speed Dial Option Mask'
		badheaders << x
	end
end

badheaders.each do |bad|
	original.delete(bad)
end


CSV.open(exportfile, 'w') do |csv|
	original.each do |row|
		csv << row
	end
end