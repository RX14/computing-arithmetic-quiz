Given(/^the following students exist:$/) do |table|
    table.hashes.each do |hash|
        Student.create(hash)
    end
end
