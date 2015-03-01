class Quiz < Sequel::Model
    many_to_one :student
end
