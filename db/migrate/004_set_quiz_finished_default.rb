Sequel.migration do
    up do
        alter_table :quizzes do
            set_column_default :finished, false
        end
    end
end
