Sequel.migration do
    up do
        create_table :quizzes do
            primary_key :id
            String :questions
            Boolean :finished
            foreign_key :student_id
        end
    end

    down do
        drop_table :quizzes
    end
end
