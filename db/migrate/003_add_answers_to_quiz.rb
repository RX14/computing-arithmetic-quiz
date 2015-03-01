Sequel.migration do
    up do
        alter_table :quizzes do
            add_column :answers, String
        end
    end

    down do
        alter_table :quizzes do
            drop_column :answers
        end
    end
end
